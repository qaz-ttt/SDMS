package ct.test.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ct.admin.bean.repairMapper;

@Controller
public class repairUserControl {
	
	@Autowired
	public repairMapper re;
	
	// 查询
	@RequestMapping("/user/repair/repairList")
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

		ModelAndView mdAndView = new ModelAndView("repairUser");
		return mdAndView.addObject("maplist", maplist);
	}

}
