package ct.admin.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ct.admin.bean.notice;
import ct.admin.bean.noticeMapper;

@Controller
public class adminNoticeControl {

	// 消息管理
	@Autowired
	private noticeMapper not;

	// 最新消息
	// 查询


	@RequestMapping(value = "/noticeAdmin/selectNotice")
	public ModelAndView Stulist(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		PageHelper.startPage(pn, 5);
		List<Map<String, String>> maplist = not.selectNotice();
		PageInfo page = new PageInfo(maplist, 3);

		int[] nums = page.getNavigatepageNums();
		for (int num : nums) {
			System.out.println("" + num);
		}
		// 将对象传到前端
		model.addAttribute("PageInfo", page);

		ModelAndView mdAndView = new ModelAndView("noticeAdmin");
		return mdAndView.addObject("maplist", maplist);
	}

	// 通过id获取信息
	@RequestMapping(value = "/noticeAdmin/selectById")
	@ResponseBody
	public String getStuById(Integer notice_id) {

		notice no = not.selectById(notice_id);

		System.out.println("----------------------------------------");
		String json = JSONObject.toJSONString(no);
		System.out.println(no.toString());
		return json;
	}

	// 新建消息
	@RequestMapping(value = "/noticeAdmin/newNotice")
	@ResponseBody
	public String newNotice(String new_notice_msg) {
		// 新建
		Integer i = not.NewNotice(new_notice_msg);

		String data = "";
		if (i > 0) {
			data = "OK";
		}

		return data;
	}

	// 删除
	@RequestMapping(value = "/noticeAdmin/delNotice")
	@ResponseBody
	public String delNotice(Integer notice_id) {

		Integer i = not.delNotice(notice_id);
		String data = "";
		if (i > 0) {
			data = "OK";
		}
		return data;
	}

	// 修改
	@RequestMapping(value = "/noticeAdmin/updateNotice")
	@ResponseBody
	public String updateNotice(Integer notice_id, String edit_notice_msg) {

		Integer i = not.updateNotice(notice_id, edit_notice_msg);

		String data = "";
		if (i > 0) {
			data = "OK";
			System.out.println(i);

		}
		System.out.println(i);
		System.out.println(data);
		return data;

	}
}
