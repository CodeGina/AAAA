package user.domain;

import java.util.List;

public class UserHobby {
	private int uid;
	private int hid;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public UserHobby(int uid, int hid) {
		super();
		this.uid = uid;
		this.hid = hid;
	}
	@Override
	public String toString() {
		return "UserHobby [uid=" + uid + ", hid=" + hid + "]";
	}
	
	
	
}
