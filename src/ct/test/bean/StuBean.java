package ct.test.bean;

import java.util.Arrays;

public class StuBean {
	   private Integer stu_id;
      
       private String stu_home;
       private String major;
       private String bad;
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}

	public String getStu_home() {
		return stu_home;
	}
	public void setStu_home(String stu_home) {
		this.stu_home = stu_home;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getBad() {
		return bad;
	}
	public void setBad(String bad) {
		this.bad = bad;
	}
	@Override
	public String toString() {
		return "StuBean [stu_id=" + stu_id + ", username=" + ", stu_home="
				+ stu_home + ", major=" + major + ", bad=" + bad + "]";
	}

       
}













