package ct.admin.bean;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ct.test.bean.disciplineBean;


public interface disciplineMapper {
	// 插入数据Discipline
	@Insert("INSERT INTO discipline (`discipline_state`,`discipline_remark`,`time`)"
			+ "VALUES (#{discipline_state},#{discipline_remark},now())")
	public int NewDiscipline(@Param("discipline_state") String discipline_state,
			@Param("discipline_remark") String discipline_remark);

	// 查询所有的
	@Select("select *  from discipline order by discipline_id ")
	public List<Map<String, String>> selectDiscipline();

	// 修改数据
	@Update("UPDATE discipline SET discipline_state =#{discipline_state},discipline_remark =#{discipline_remark}  WHERE discipline_id = #{discipline_id}")
	public Integer updateDiscipline(@Param("discipline_id") Integer discipline_id, @Param("discipline_state") String discipline_state,
			@Param("discipline_remark") String discipline_remark);

	// 通过id查询所有信息
	@Select("select * from discipline where discipline_id=#{discipline_id}")
	public disciplineBean selectById(@Param("discipline_id") Integer discipline_id);

	// 通过id删除
	@Delete("delete  from hygiene where discipline_id=#{discipline_id}")
	public int delDiscipline(Integer discipline_id);

}
