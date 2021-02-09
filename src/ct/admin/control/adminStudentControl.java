package ct.admin.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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

import ct.admin.bean.adminMapper;
import ct.admin.bean.notice;
import ct.admin.bean.studentMapper;

import ct.test.bean.StuBean;

@Controller
public class adminStudentControl {

	@Autowired
	private studentMapper stu;

	// 学生管理
	@RequestMapping("/admin/student")
    public ModelAndView Stulist(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model, HttpServletRequest request, HttpServletResponse response){
    	
        PageHelper.startPage(pn,5);
       
        List<Map<String, String>> maplist = stu.selectall();
        
        PageInfo page = new PageInfo(maplist, 3);
        
       
        int[] nums = page.getNavigatepageNums();
        for (int num : nums) {
            System.out.println(""+num);
        }
        //将对象传到前端
        model.addAttribute("PageInfo",page);

        ModelAndView mdAndView = new ModelAndView("studentAdmin");
		return mdAndView.addObject("maplist", maplist);
    }


	
	
	
// 通过id获取信息
	@RequestMapping(value = "/StuAdmin/selectById")
	@ResponseBody
	public String getStuById(Integer stu_id) {

		 StuBean user = stu.selectById(stu_id);

		System.out.println("----------------------------------------");
		String json = JSONObject.toJSONString(user);
		System.out.println(user.toString());
		return json;
	}



	// 学生的修改
	@RequestMapping(value = "/StuAdmin/updateStu")
	@ResponseBody
	public String updateNotice(Integer stu_id,  String edit_stu_home, String edit_major,String edit_bad) {
		Integer i = stu.updateStu(stu_id, edit_stu_home, edit_major, edit_bad);
		String data = "";
		if (i > 0) {
			data = "OK";
			System.out.println(i);

		}
		System.out.println(i);
		System.out.println(data);
		return data;

	}

	// 学生的删除

	@RequestMapping(value = "/StuAdmin/delStu")
	@ResponseBody
	public String delNotice(Integer stu_id) {
		int i = stu.delStu(stu_id);
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
