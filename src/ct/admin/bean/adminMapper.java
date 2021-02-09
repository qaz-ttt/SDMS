package ct.admin.bean;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ct.test.bean.StuBean;

public interface adminMapper {
	//管理员登陆
	@Select("select *  from admin  where admin_id = #{admin_id}  and admin_password =#{admin_password}")
	public adminBean select(@Param("admin_id") String admin_id, @Param("admin_password") String admin_password);
	
	//修改密码
	@Update("update admin_password set  admin_password= #{admin_password} where admin_id = #{admin_id}")
	public int update(@Param("admin_id") String admin_id, @Param("admin_password") String admin_password);
	

}
