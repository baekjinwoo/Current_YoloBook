package yolo.book.program;

import org.springframework.web.multipart.MultipartFile;

public class ProgramVO { 
	private int p_number;
	private int m_number;
	private String p_name;
	private String starttime;
	private String endtime;
	private String p_date;
	private String price;
	private int limitofstudents;
	private String p_introduction;
	private String p_syllabus_filename;
	private MultipartFile p_syllabus_file;
	private String p_thumbnail_filename;
	private MultipartFile p_thumbnail_file;
	private int p_class;
	private int p_status;
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public int getM_number() {
		return m_number;
	}
	public void setM_number(int m_number) {
		this.m_number = m_number;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getLimitofstudents() {
		return limitofstudents;
	}
	public void setLimitofstudents(int limitofstudents) {
		this.limitofstudents = limitofstudents;
	}
	public String getP_introduction() {
		return p_introduction;
	}
	public void setP_introduction(String p_introduction) {
		this.p_introduction = p_introduction;
	}
	public String getP_syllabus_filename() {
		return p_syllabus_filename;
	}
	public void setP_syllabus_filename(String p_syllabus_filename) {
		this.p_syllabus_filename = p_syllabus_filename;
	}
	public MultipartFile getP_syllabus_file() {
		return p_syllabus_file;
	}
	public void setP_syllabus_file(MultipartFile p_syllabus_file) {
		this.p_syllabus_file = p_syllabus_file;
	}
	public String getP_thumbnail_filename() {
		return p_thumbnail_filename;
	}
	public void setP_thumbnail_filename(String p_thumbnail_filename) {
		this.p_thumbnail_filename = p_thumbnail_filename;
	}
	public MultipartFile getP_thumbnail_file() {
		return p_thumbnail_file;
	}
	public void setP_thumbnail_file(MultipartFile p_thumbnail_file) {
		this.p_thumbnail_file = p_thumbnail_file;
	}
	public int getP_class() {
		return p_class;
	}
	public void setP_class(int p_class) {
		this.p_class = p_class;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	
	
	

	
	

	
	
}
