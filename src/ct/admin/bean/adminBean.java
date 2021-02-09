package ct.admin.bean;

public class adminBean {
           public Integer id;
           public String admin_name;
           public String admin_password;
           public String admin_phone;
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getAdmin_name() {
			return admin_name;
		}
		public void setAdmin_name(String admin_name) {
			this.admin_name = admin_name;
		}
		public String getAdmin_password() {
			return admin_password;
		}
		public void setAdmin_password(String admin_password) {
			this.admin_password = admin_password;
		}
		public String getAdmin_phone() {
			return admin_phone;
		}
		public void setAdmin_phone(String admin_phone) {
			this.admin_phone = admin_phone;
		}
		@Override
		public String toString() {
			return "adminBean [id=" + id + ", admin_name=" + admin_name + ", admin_password=" + admin_password
					+ ", admin_phone=" + admin_phone + "]";
		}
           
           
}
