package ct.admin.bean;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ct.test.bean.repairBean;

public interface repairMapper {

    
	//插入数据
	@Insert("INSERT INTO repair (`type`, `state`,`remark`)" + "VALUES (#{type},'未解决',#{remark})")
	 public int NewRepair(@Param("type") String type,@Param("remark") String remark);
	
	//查询所有的
	@Select("select *  from repair order by repair_id ")
	public List<Map<String,String>> selectRepair();
	
	//修改数据
	@Update("UPDATE repair SET type =#{type},state =#{state},remark =#{remark}  WHERE repair_id = #{repair_id}" )

	 public Integer updateRepair(@Param("repair_id") Integer repair_id,@Param("type") String type,@Param("state") String state,@Param("remark") String remark);
	
		
	//通过id查询所有信息
	@Select("select * from repair where repair_id=#{repair_id}")
	public repairBean selectById(@Param("repair_id")Integer repair_id);
	
	//通过id删除
	@Delete("delete  from repair where repair_id=#{repair_id}")
	public int delRepair(Integer repair_id);
	
	
}
