package ct.test.bean;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
	// 登陆的方法
		@Select("select *  from user  where user_id = #{user_id}  and password =#{password}")
        public UserBean select(@Param("user_id") String user_id,@Param("user_name") String user_name, @Param("password") String password);

		// 注册的方法
		@Insert("INSERT INTO `sdms`.`user`(`user_name`, `password`,`stu_id`) "
				+ "VALUES (#{user_name}, #{password},#{stu_id})")
		public int Insert( @Param("user_name") String user_name,@Param("password") String password,@Param("stu_id") String stu_id);



}
