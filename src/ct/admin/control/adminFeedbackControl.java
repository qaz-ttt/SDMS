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

import ct.admin.bean.feedbackMapper;

import ct.test.bean.feedbackBean;

@Controller
public class adminFeedbackControl {
	// 消息管理
	@Autowired
	private feedbackMapper feedback;

	// 最新消息
	// 查询
	@RequestMapping(value = "/feedbackAdmin/selectFeedback")
public ModelAndView selectFeedback(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		PageHelper.startPage(pn, 5);
		List<Map<String, String>> maplist = feedback.selectFeedback();
		PageInfo page = new PageInfo(maplist, 3);

		int[] nums = page.getNavigatepageNums();
		for (int num : nums) {
			System.out.println("" + num);
		}
		// 将对象传到前端
		model.addAttribute("PageInfo", page);

		ModelAndView mdAndView = new ModelAndView("feedbackAdmin");
		return mdAndView.addObject("maplist", maplist);
	}

	// 通过id获取信息
	@RequestMapping(value = "/feedbackAdmin/selectById")
	@ResponseBody
	public String selectById(Integer feedback_id) {

		feedbackBean feed = feedback.selectById(feedback_id);

		System.out.println("----------------------------------------");
		String json = JSONObject.toJSONString(feed);
		System.out.println(feed.toString());
		return json;
	}

	// 新建消息
	@RequestMapping(value = "/feedbackAdmin/newFeedback")
	@ResponseBody
	public String newFeedback(String new_feedback_msg) {
		// 新建
		int i = feedback.NewFeedback(new_feedback_msg);

		String data = "";
		if (i > 0) {
			data = "OK";
		}

		return data;
	}

	// 删除
	@RequestMapping(value = "/feedbackAdmin/delFeedback")
	@ResponseBody
	public String delFeedback(Integer feedback_id) {

		int i = feedback.delFeedback(feedback_id);
		String data = "";
		if (i > 0) {
			data = "OK";
		}
		return data;
	}

	// 修改
	@RequestMapping(value = "/feedbackAdmin/updateFeedback")
	@ResponseBody
	public String updateFeedback(Integer feedback_id, String edit_feedback_msg) {

		Integer i = feedback.updateFeedback(feedback_id, edit_feedback_msg);

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
