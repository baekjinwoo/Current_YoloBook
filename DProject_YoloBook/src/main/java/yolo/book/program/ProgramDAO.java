package yolo.book.program;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProgramDAO {
	@Autowired
	SqlSession session;
	
	
	
	public ProgramVO getProgram(int p_number) {
		return session.selectOne("program.getProgram", p_number);
	}
	
	public List<ProgramVO> getProgramList() {
		return session.selectList("program.selectAll");
	}
	
	public void deleteProgram(String number) {
		session.delete("program.deleteProgram", number);
	}
	
	public void payProgram(int m_number, int p_number, String payinfo){
		BookVO book = new BookVO();
		book.setM_number(m_number);
		book.setP_number(p_number);
		book.setPayinfo(payinfo);
		session.insert("program.insertPayInfo",book);
	}
	
	public List<ProgramVO> getRandomProgram() {
		return session.selectList("program.getRandomProgram");
	}
	
	public List<ProgramVO> getProgramBeforeApproval() {
		return session.selectList("program.getProgramBeforeApproval");
	}

	public void insertRegisterProgram(ProgramVO program){
		session.insert("program.registerprogram", program);
	}
	
	public void approveProgram(int p_number){
		session.update("program.approveProgram", p_number);
	}
	
	public List<ProgramVO> alterGradeList() {
		return session.selectList("program.alterGradeList");
	}
}
