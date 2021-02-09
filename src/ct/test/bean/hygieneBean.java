package ct.test.bean;

public class hygieneBean {
	private Integer hygiene_id;
	private String  hygiene_state;
	private String  hygiene_details;
	private String  time;
	public Integer getHygiene_id() {
		return hygiene_id;
	}
	public void setHygiene_id(Integer hygiene_id) {
		this.hygiene_id = hygiene_id;
	}
	public String getHygiene_state() {
		return hygiene_state;
	}
	public void setHygiene_state(String hygiene_state) {
		this.hygiene_state = hygiene_state;
	}
	public String getHygiene_details() {
		return hygiene_details;
	}
	public void setHygiene_details(String hygiene_details) {
		this.hygiene_details = hygiene_details;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "hygieneBean [hygiene_id=" + hygiene_id + ", hygiene_state=" + hygiene_state + ", hygiene_details="
				+ hygiene_details + ", time=" + time + "]";
	}
	
	
	
	

}
