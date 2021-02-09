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

import ct.admin.bean.repairMapper;
import ct.test.bean.repairBean;

@Controller
public class adminRepairControl {
	@Autowired
	public repairMapper re;

	// 查询
	@RequestMapping("/admin/repair/repairList")
	public ModelAndView repairList(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		PageHelper.startPage(pn, 5);

		List<Map<String, String>> maplist = re.selectRepair();
		PageInfo page = new PageInfo(maplist, 3);

		int[] nums = page.getNavigatepageNums();
		for (int num : nums) {
			System.out.println("" + num);
		}
		// 将对象传到前端
		model.addAttribute("PageInfo", page);

		ModelAndView mdAndView = new ModelAndView("repairAdmin");
		return mdAndView.addObject("maplist", maplist);
	}

	// 新建
	@RequestMapping(value = "/admin/repair/newRepair")
	@ResponseBody
	public String newRepair(String new_type, String new_remark) {
		// 新建
		int i = re.NewRepair(new_type, new_remark);

		String data = "";
		if (i > 0) {
			data = "OK";
		}

		return data;
	}

	// 通过id获取信息
	@RequestMapping(value = "/admin/repair/selectById")
	@ResponseBody
	public String getRepairById(Integer repair_id) {

		repairBean repair = re.selectById(repair_id);

		System.out.println("----------------------------------------");
		String json = JSONObject.toJSONString(repair);
		System.out.println(repair.toString());
		return json;
	}

	// 修改s
	@RequestMapping(value = "/admin/repair/updateRepair")
	@ResponseBody
	public String updaterepair(Integer repair_id, String edit_type, String edit_state, String edit_remark) {
		System.out.println("repair_id:"+repair_id+"edit_type:"+edit_type+"edit_state:"+edit_state+"edit_remark:"+edit_remark);
		Integer i = re.updateRepair(repair_id, edit_type, edit_state, edit_remark);
		String data = "";
		if (i > 0) {
			data = "OK";
			System.out.println(i);

		}
		System.out.println(i);
		System.out.println(data);
		return data;

	}

	// 删除
	@RequestMapping(value = "/admin/repair/DelRepair")
	@ResponseBody
	public String DelRepair(Integer repair_id) {
		Integer i = re.delRepair(repair_id);
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
