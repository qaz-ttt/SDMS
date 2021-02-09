package ct.admin.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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

import ct.admin.bean.hygieneMapper;
import ct.test.bean.hygieneBean;


@Controller
public class adminHygieneControl {
	@Autowired
	private hygieneMapper hy;
	
	// 查询
		@RequestMapping("/admin/hygiene/hygieneList")
		public ModelAndView repairList(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
				HttpServletRequest request, HttpServletResponse response) {

			PageHelper.startPage(pn, 5);

			List<Map<String, String>> maplist = hy.selectHygiene();
			PageInfo page = new PageInfo(maplist, 3);

			int[] nums = page.getNavigatepageNums();
			for (int num : nums) {
				System.out.println("" + num);
			}
			// 将对象传到前端
			model.addAttribute("PageInfo", page);

			ModelAndView mdAndView = new ModelAndView("hygieneAdmin");
			return mdAndView.addObject("maplist", maplist);
		}

		// 新建
		@RequestMapping(value = "/admin/hygiene/newhygiene")
		@ResponseBody
		public String newRepair(String hygiene_state,String hygiene_details) {
			// 新建
			int i = hy.NewHygiene(hygiene_state, hygiene_details);
			

			String data = "";
			if (i > 0) {
				data = "OK";
			}

			return data;
		}

		// 通过id获取信息
		@RequestMapping(value = "/admin/hygiene/selectById")
		@ResponseBody
		public String getRepairById(Integer hygiene_id) {

			hygieneBean repair = hy.selectById(hygiene_id);

			System.out.println("----------------------------------------");
			String json = JSONObject.toJSONString(repair);
			System.out.println(repair.toString());
			return json;
		}

		// 修改
		@RequestMapping(value = "/admin/hygiene/updatehygiene")
		@ResponseBody
		public String updaterepair(Integer hygiene_id, String edit_hygiene_state, String edit_hygiene_details) {
			
			Integer i = hy.updateHygiene(hygiene_id, edit_hygiene_details, edit_hygiene_details);
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
		@RequestMapping(value = "/admin/hygiene/Delhygiene")
		@ResponseBody
		public String DelRepair(Integer hygiene_id) {
			Integer i = hy.delHygiene(hygiene_id);
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
