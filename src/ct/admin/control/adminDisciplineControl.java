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

import ct.admin.bean.disciplineMapper;
import ct.admin.bean.hygieneMapper;
import ct.test.bean.disciplineBean;
import ct.test.bean.hygieneBean;

@Controller
public class adminDisciplineControl {
	@Autowired
	private  disciplineMapper dis;
	
	
	// 查询
		@RequestMapping("/admin/discipline/disciplineList")
		public ModelAndView repairList(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model,
				HttpServletRequest request, HttpServletResponse response) {

			PageHelper.startPage(pn, 5);

			List<Map<String, String>> maplist = dis.selectDiscipline();
			PageInfo page = new PageInfo(maplist, 3);

			int[] nums = page.getNavigatepageNums();
			for (int num : nums) {
				System.out.println("" + num);
			}
			// 将对象传到前端
			model.addAttribute("PageInfo", page);

			ModelAndView mdAndView = new ModelAndView("disciplineAdmin");
			return mdAndView.addObject("maplist", maplist);
		}

		// 新建
		@RequestMapping(value = "/admin/discipline/newdiscipline")
		@ResponseBody
		public String newRepair(String discipline_state,String discipline_remark) {
			// 新建
			int i = dis.NewDiscipline(discipline_state, discipline_remark);
			

			String data = "";
			if (i > 0) {
				data = "OK";
			}

			return data;
		}

		// 通过id获取信息
		@RequestMapping(value = "/admin/discipline/selectById")
		@ResponseBody
		public String getRepairById(Integer discipline_id) {

			disciplineBean dBean = dis.selectById(discipline_id);

			System.out.println("----------------------------------------");
			String json = JSONObject.toJSONString(dBean);
			System.out.println(dBean.toString());
			return json;
		}

		// 修改
		@RequestMapping(value = "/admin/discipline/updateDiscipline")
		@ResponseBody
		public String updaterepair(Integer discipline_id, String edit_discipline_state, String edit_discipline_remark) {
			
			Integer i = dis.updateDiscipline(discipline_id, edit_discipline_state, edit_discipline_remark);
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
		@RequestMapping(value = "/admin/discipline/Deldiscipline")
		@ResponseBody
		public String DelRepair(Integer discipline_id) {
			Integer i = dis.delDiscipline(discipline_id);
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
