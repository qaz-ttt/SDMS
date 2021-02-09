package ct.test.bean;

public class feedbackBean {
	private Integer feedback_id;
	private String feedback_msg;
	private String time;
	public Integer getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(Integer feedback_id) {
		this.feedback_id = feedback_id;
	}
	public String getFeedback_msg() {
		return feedback_msg;
	}
	public void setFeedback_msg(String feedback_msg) {
		this.feedback_msg = feedback_msg;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "feedbackBean [feedback_id=" + feedback_id + ", feedback_msg=" + feedback_msg + ", time=" + time + "]";
	}
	
	
}
