package ct.test.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ct.test.bean.StuBean;
import ct.test.bean.UserBean;
import ct.test.bean.UserMapper;

@Controller
public class UserCon {
	 @Autowired
	private UserMapper userMapper; 
	
	 
	 //登陆
	@RequestMapping("/save")
	public String select(String user_id,String user_name,String password,Model model, HttpSession session) {
		UserBean user = userMapper.select(user_id, user_name, password);
		
			if(user != null){		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			// 跳转到主页面
           return "userIndex";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
         // 返回到登录页面
		return "login";
	}
	
	//注册
	@RequestMapping("/NewUser")
	public String NewStu(String user_name,String password, String stu_id,Model model, HttpSession session) {
		int num=userMapper.Insert(user_name, password, stu_id);
		if(num ==1){		
        return "login";
		}
		model.addAttribute("newmsg", "注册失败");
         // 返回到登录页面
	     return "signup";
		
	}
	
	
}
