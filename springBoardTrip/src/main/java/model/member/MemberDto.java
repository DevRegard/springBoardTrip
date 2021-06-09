package model.member;
import java.util.Date;

public class MemberDto {
	private String m_id;
	private String m_pw;
	private String m_name;
	
	private String m_jumin1;
	private String m_jumin2;
	
	private String m_email;
	private String m_email2;
	private String m_zipcode;
	private String m_addr;
	
	private Date m_regdate;
	
	public MemberDto() {}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_jumin1() {
		return m_jumin1;
	}

	public void setM_jumin1(String m_jumin1) {
		this.m_jumin1 = m_jumin1;
	}

	public String getM_jumin2() {
		return m_jumin2;
	}

	public void setM_jumin2(String m_jumin2) {
		this.m_jumin2 = m_jumin2;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_email2() {
		return m_email2;
	}

	public void setM_email2(String m_email2) {
		this.m_email2 = m_email2;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public Date getM_regdate() {
		return m_regdate;
	}

	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}

}//class end