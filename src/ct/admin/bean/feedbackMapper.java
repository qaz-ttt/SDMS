package ct.admin.bean;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ct.test.bean.feedbackBean;

public interface feedbackMapper {
	// 插入数据
	@Insert("INSERT INTO feedback (`feedback_msg`,time)" + "VALUES (#{feedback_msg},now()")
	public int NewFeedback(@Param("feedback_msg") String feedback_msg);

	// 查询
	@Select("select *  from feedback  order by feedback_id desc")
	public List<Map<String, String>> selectFeedback();

	// 修改数据
	@Update("UPDATE feedback SET feedback_msg =#{feedback_msg}  WHERE feedback_id = #{feedback_id}")
	public Integer updateFeedback(@Param("feedback_id") Integer feedback_id,
			@Param("feedback_msg") String feedback_msg);

	// 通过id查询所有信息
	@Select("select * from feedback where feedback_id=#{feedback_id}")
	public feedbackBean selectById(@Param("feedback_id") Integer feedback_id);

	// 通过id删除
	@Delete("delete  from feedback where feedback_id=#{feedback_id}")
	public int delFeedback(Integer feedback_id);
}
