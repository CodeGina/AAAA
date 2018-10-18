package user.domain;

public class Hobby {
	private int hid;
	private String hobby;

	public int getHid() {
		return hid;
	}

	public void setHid(int hid) {
		this.hid = hid;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public Hobby(int hid, String hobby) {
		super();
		this.hid = hid;
		this.hobby = hobby;
	}

	@Override
	public String toString() {
		return "Hobby [hid=" + hid + ", hobby=" + hobby + "]";
	}

	public Hobby() {
		super();
		// TODO Auto-generated constructor stub
	}

}
