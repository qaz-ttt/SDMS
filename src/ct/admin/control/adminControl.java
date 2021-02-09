package ct.admin.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import ct.admin.bean.adminBean;
import ct.admin.bean.adminMapper;
import ct.admin.bean.notice;
import ct.admin.bean.noticeMapper;

@Controller
public class adminControl {

	@Autowired
	private adminMapper ad;

	
	@RequestMapping(value = "toAdminLogin")
	public String toadminlogin() {
		return "adminLogin";
	}
		
	// 登录的方法
	@RequestMapping(value = "adminLogin")
	public String adminLogin(String admin_id, String admin_password, Model model, HttpSession session) {
		adminBean admin = ad.select(admin_id, admin_password);

		if (admin != null) {
			// 将用户对象添加到Session
			session.setAttribute("ADMIN_SESSION", admin);
			// 跳转到主页面
			return "adminBackstage";
		}
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
		// 返回到登录页面
		return "adminLogin";
	}

	@RequestMapping(value = "/admin/updatepassword")
	public String updateAdminpassword(String admin_id,String admin_password ) {
		int i = ad.update(admin_id, admin_password);
		String date="";
		if (i>0) {
			date="ok";
		}
		return "admintopBackstage";
	}
	
	
	

	@RequestMapping(value = "/topadmin")
	public String topadmin() {
		return "admintopBackstage";
	}

	@RequestMapping(value = "/leftadmin")
	public String leftadmin() {
		return "adminLeftBackstage";
	}

	@RequestMapping(value = "/mainadmin")
	public String mainadmin() {
		return "noticeAdmin";
	}

	

	@RequestMapping(value = "tologin")
	public String tologin() {
		return "login";
	}

}