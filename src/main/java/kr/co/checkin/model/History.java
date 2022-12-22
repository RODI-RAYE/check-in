package kr.co.checkin.model;

public class History {
	private int code;
	private String id;
	private int num;
	private int home;
	private String time;
	private String problem;
	private String homeName;
	private String filename;
	private String uuid;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getHome() {
		return home;
	}
	public void setHome(int home) {
		this.home = home;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getProblem() {
		return problem;
	}
	public void setProblem(String problem) {
		this.problem = problem;
	}
	public String getHomeName() {
		return homeName;
	}
	public void setHomeName(String homeName) {
		this.homeName = homeName;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
}
