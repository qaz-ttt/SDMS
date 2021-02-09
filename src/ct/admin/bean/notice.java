package ct.admin.bean;

public class notice {
     public Integer noticeInteger;
     public String notice_msg;
     public String time;
	public Integer getNoticeInteger() {
		return noticeInteger;
	}
	public void setNoticeInteger(Integer noticeInteger) {
		this.noticeInteger = noticeInteger;
	}
	public String getNotice_msg() {
		return notice_msg;
	}
	public void setNotice_msg(String notice_msg) {
		this.notice_msg = notice_msg;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "notice [noticeInteger=" + noticeInteger + ", notice_msg=" + notice_msg + ", time=" + time + "]";
	}
	
     
     
     
}
