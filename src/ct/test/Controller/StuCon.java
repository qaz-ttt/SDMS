package ct.test.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import ct.test.bean.StuBean;
import ct.test.bean.StuMapper;

@Controller
public class StuCon {
	@Autowired
    private StuMapper stuMapper;
	 

	


	
	@RequestMapping("/NewStu")
	public String NewStu(Integer stu_id,String stu_home, String major, String bad,Model model, HttpSession session) {
		int num=stuMapper.Insert(stu_id, stu_home, major, bad);
		if(num ==1){		
        return "login";
		}
		model.addAttribute("newmsg", "注册失败");
         // 返回到登录页面
	     return "signup";
		
	}
	
	@RequestMapping(value = "/")
	public String toindex() {
	    return "index";
	}
	
	@RequestMapping(value = "signup")
	public String tosignup() {
	    return "signup";
	}
	
	
	 @RequestMapping(value = "/topuser")
	public String topadmin() {
		return "userTop";
	}

	@RequestMapping(value = "/leftuser")
	public String leftadmin() {
		return "userLeft";
	}

	@RequestMapping(value = "/mainuser")
	public String mainadmin() {
		return "usermain";
	}

	@RequestMapping(value = "/user")
	public String toadmin1() {
		return "userIndex";
	}


	
	
	
	
	
	
}
