package model.notice;

import java.util.Date;

public class NoticeDto {

	private int n_num;
	private int n_readcount;
	
	private String user;
	private String n_subject;
	private String n_content;
	private String u_pass;
	
	private Date wdate; //dataType 변경 예정 ***
	private String ip;
	
	public NoticeDto() {} //디폴트 생성자 

	public String getU_pass() {
		return u_pass;
	}

	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getN_subject() {
		return n_subject;
	}

	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getN_readcount() {
		return n_readcount;
	}

	public void setN_readcount(int n_readcount) {
		this.n_readcount = n_readcount;
	}
	
}//class end
