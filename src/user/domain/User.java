package user.domain;

import java.util.List;

public class User {
	private int uid;//主键
	private String username;// 登录名
	private String password;// 登录密码
	private int usertype;// 用户类型
	private String gender;// 性别
	private String birthday;// 生日
	private String email;// 邮箱
	private String introduction;// 自我介绍
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public User(int uid, String username, String password, int usertype,
			String gender, String birthday, String email, String introduction) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
		this.usertype = usertype;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.introduction = introduction;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "UserPojo [uid=" + uid + ", username=" + username
				+ ", password=" + password + ", usertype=" + usertype
				+ ", gender=" + gender + ", birthday=" + birthday + ", email="
				+ email + ", introduction=" + introduction + "]";
	}
	
	
	
}
