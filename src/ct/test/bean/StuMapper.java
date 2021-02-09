package ct.test.bean;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface StuMapper {
	

	// 注册的方法
	@Insert("INSERT INTO `sdms`.`stu`(`stu_id`, `stu_home`, `major`, `bad`) "
			+ "VALUES (#{stu_id}, #{stu_home}, #{major}, #{bad})")
	public int Insert(@Param("stu_id") Integer stu_id, @Param("stu_home") String stu_home, @Param("major") String major,
			@Param("bad") String bad);

}
