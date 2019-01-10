package yolo.book.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.book.program.BookVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public MemberVO checkLogin(String id) {
		return dao.checkLogin(id);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public int insertMember(MemberVO member) {
		return dao.insertMember(member);
	}

	@Override
	public void deleteMember(String id, String pw) {
		dao.deleteMember(id, pw);
	}

	@Override
	public void updateMember(String id, String pw, String phone, String m_name, String email) {
		dao.updateMember(id, pw, phone, m_name, email);
	}

	@Override
	public String checkId(String id) {
		return dao.checkId(id);
	}
	
	@Override
	public List<BookVO> getMybook(int m_number) {
		return dao.getMybook(m_number);
	}

	@Override
	public List<MemberVO> getLecturerBeforeApproval() {
		return dao.getLecturerBeforeApproval();
	}

	@Override
	public void approveMember2(int m_number) {
		dao.approveMember2(m_number);
	}
	
	@Override
	public String alterGrade(int m_status) {
		return dao.alterGrade(m_status);
	}

	@Override
	public List<MemberVO> alterGradeList() {
		return dao.alterGradeList();
	}
	
}
