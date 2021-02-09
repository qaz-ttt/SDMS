package ct.test.bean;

public class disciplineBean {
	private Integer discipline_id;
	private String  discipline_state;
	private String  discipline_remark;
	private String time;
	public Integer getDiscipline_id() {
		return discipline_id;
	}
	public void setDiscipline_id(Integer discipline_id) {
		this.discipline_id = discipline_id;
	}
	public String getDiscipline_state() {
		return discipline_state;
	}
	public void setDiscipline_state(String discipline_state) {
		this.discipline_state = discipline_state;
	}
	public String getDiscipline_remake() {
		return discipline_remark;
	}
	public void setDiscipline_remake(String discipline_remake) {
		this.discipline_remark = discipline_remake;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "disciplineBean [discipline_id=" + discipline_id + ", discipline_state=" + discipline_state
				+ ", discipline_remake=" + discipline_remark + ", time=" + time + "]";
	}
	
	
	
}
