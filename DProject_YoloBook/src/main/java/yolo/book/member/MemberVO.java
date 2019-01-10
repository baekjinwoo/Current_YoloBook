package yolo.book.member;

import org.springframework.web.multipart.MultipartFile;

//M_NUMBER NUMBER(11) CONSTRAINT MEMBER_M_NUMBER_PK PRIMARY KEY NOT NULL,
//ID VARCHAR2(30) CONSTRAINT MEMBER_ID_NN NOT NULL,
//PW VARCHAR2(30) CONSTRAINT MEMBER_PW_NN NOT NULL,
//EMAIL VARCHAR2(100) CONSTRAINT MEMBER_EMAIL_CK CHECK(EMAIL LIKE '%@%') UNIQUE,
//PHONE VARCHAR2(100) CONSTRAINT MEMBER_PHONE_NN NOT NULL,
//M_NAME VARCHAR2(100) CONSTRAINT MEMBER_M_NAME_NN NOT NULL,
//M_STATUS NUMBER(11) CONSTRAINT MEMBER_M_STATUS_FK REFERENCES MEMBER_STATUS(M_STATUS) NOT NULL,
//CERTIFICATION_FILENAME VARCHAR2(200) CONSTRAINT MEMBER_CERTIRICATION_N NULL,
//M_INTRODUCTION VARCHAR2

public class MemberVO {
	private int m_number;
	private String id;
	private String pw;
	private String email;
	private String phone;
	private String m_name;
	private int m_status;
	private String certification_filename;
	private MultipartFile m_introduction_file;
	private String m_introduction;

	public MemberVO() {
		super();
	}

	public MemberVO(int m_number, String id, String pw, String email, String phone, String m_name, int m_status,
			String certification_filename, MultipartFile m_introduction_file, String m_introduction) {
		super();
		this.m_number = m_number;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.phone = phone;
		this.m_name = m_name;
		this.m_status = m_status;
		this.certification_filename = certification_filename;
		this.m_introduction_file = m_introduction_file;
		this.m_introduction = m_introduction;
	}

	public int getM_number() {
		return m_number;
	}

	public void setM_number(int m_number) {
		this.m_number = m_number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_status() {
		return m_status;
	}

	public void setM_status(int m_status) {
		this.m_status = m_status;
	}

	public String getCertification_filename() {
		return certification_filename;
	}

	public void setCertification_filename(String certification_filename) {
		this.certification_filename = certification_filename;
	}

	public MultipartFile getM_introduction_file() {
		return m_introduction_file;
	}

	public void setM_introduction_file(MultipartFile m_introduction_file) {
		this.m_introduction_file = m_introduction_file;
	}

	public String getM_introduction() {
		return m_introduction;
	}

	public void setM_introduction(String m_introduction) {
		this.m_introduction = m_introduction;
	}
}
