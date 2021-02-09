package ct.admin.bean;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ct.test.bean.hygieneBean;

public interface hygieneMapper {
	
	// 插入数据
		@Insert("INSERT INTO hygiene (`hygiene_state`,`hygiene_details`,`time`)" + "VALUES (#{hygiene_state},#{hygiene_details},now())")
		public int NewHygiene(@Param("hygiene_state") String hygiene_state,@Param("hygiene_details") String hygiene_details);
		
		//查询所有的
		@Select("select *  from hygiene order by hygiene_id ")
		public List<Map<String,String>> selectHygiene();
		

		// 修改数据
		@Update("UPDATE hygiene SET hygiene_state =#{hygiene_state},hygiene_details =#{hygiene_details}  WHERE hygiene_id = #{hygiene_id}")
		public Integer updateHygiene(@Param("hygiene_id") Integer hygiene_id,@Param("hygiene_state") String hygiene_state,@Param("hygiene_details") String hygiene_details);

		// 通过id查询所有信息
		@Select("select * from hygiene where hygiene_id=#{hygiene_id}")
		public hygieneBean selectById(@Param("hygiene_id") Integer hygiene_id);

		// 通过id删除
		@Delete("delete  from hygiene where hygiene_id=#{hygiene_id}")
		public int delHygiene(Integer hygiene_id);

}
