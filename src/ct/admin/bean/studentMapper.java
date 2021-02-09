package ct.admin.bean;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ct.test.bean.StuBean;

public interface studentMapper {

	@Select("select * from stu")
	public List<Map<String, String>> selectall();

	// 修改数据
	@Update("UPDATE stu SET  stu_home =#{stu_home} ,major =#{major}, bad =#{bad}  WHERE stu_id = #{stu_id}")
	public Integer updateStu(@Param("stu_id") Integer stu_id, @Param("stu_home") String stu_home, @Param("major") String major,
			@Param("bad") String bad);

	// 通过id删除
	@Delete("delete  from stu where stu_id=#{stu_id}")
	public int delStu(Integer stu_id);

	
	// 通过id查询所有信息
	@Select("select * from stu where stu_id=#{stu_id}")
	public StuBean selectById(@Param("stu_id") Integer stu_id);
}
