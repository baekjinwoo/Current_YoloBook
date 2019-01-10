package yolo.book.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.book.program.BookVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession session;
	
	public List<MemberVO> getLecturerBeforeApproval() {
		return session.selectList("member.getLecturerBeforeApproval");
	}
	
	
	public MemberVO checkLogin(String id) {
		return session.selectOne("member.checkLogin", id);
	}
	
	public List<MemberVO> getMemberList() {
		return session.selectList("member.getMemberList");
	}
	
	public int insertMember(MemberVO member) {
		return session.insert("member.insertMember", member);
	}
	
	public void deleteMember(String id, String pw){
		Map<String, String> map = new HashMap<String,String>();
		map.put("id",id);
		map.put("pw",pw);
		session.delete("member.deleteMember", map);
	}
	
	public void updateMember(String id, String pw, String phone, String m_name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("email", email);
		map.put("m_name", m_name);
		map.put("phone", phone);
		session.update("member.updateMember", map);
	}
	
	public String checkId(String id){
		return session.selectOne("member.checkId", id);
	}
	
	public List<BookVO> getMybook(int m_number){
		return session.selectList("member.getMybook",m_number);
	}
	
	public void approveMember2(int m_number) {
		session.update("member.approveMember2", m_number);
	}
	
	public String alterGrade(int m_status){
		return session.selectOne("member.alterGrade",m_status);
	}
	
	public List<MemberVO> alterGradeList() {
		return session.selectList("member.alterGradeList");
	}
}
