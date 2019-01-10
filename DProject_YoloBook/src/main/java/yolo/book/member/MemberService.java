package yolo.book.member;

import java.util.List;

import yolo.book.program.BookVO;

public interface MemberService {
	public MemberVO checkLogin(String id);
	public List<MemberVO> getMemberList();
	public int insertMember(MemberVO member);
	public void deleteMember(String id, String pw);
	public void updateMember(String id, String pw, String phone, String m_name, String email);
	public String checkId(String id);
	public List<BookVO> getMybook(int m_number);
	
	public List<MemberVO> getLecturerBeforeApproval();
	public void approveMember2(int m_number);
	
	public String alterGrade(int m_status);
	public List<MemberVO> alterGradeList();

}
