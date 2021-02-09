package ct.admin.bean;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface noticeMapper {
	//插入数据
	@Insert("INSERT INTO notice (`notice_msg`,time)" + "VALUES (#{notice_msg},now()")
	 public int NewNotice(@Param("notice_msg")String notice_msg);
	
	//查询所有的
	@Select("select *  from notice order by notice_id ")
	public List<Map<String,String>> selectNotice();
	
	//修改数据
		@Update("UPDATE notice SET notice_msg =#{notice_msg}  WHERE notice_id = #{notice_id}" )
		 public Integer updateNotice(@Param("notice_id")Integer notice_id,@Param("notice_msg")String notice_msg);
	
		
		//通过id查询所有信息
		@Select("select * from notice where notice_id=#{notice_id}")
		public notice selectById(@Param("notice_id")Integer notice_id);
	
	//通过id删除
	@Delete("delete  from notice where notice_id=#{notice_id}")
	public int delNotice(Integer notice_id);
}
