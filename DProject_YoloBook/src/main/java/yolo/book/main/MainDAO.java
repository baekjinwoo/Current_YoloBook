package yolo.book.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import yolo.book.program.ProgramVO;

@Repository
public class MainDAO {
	
	@Autowired
	SqlSession session;
	
	public List<ProgramVO> getProgram (){
		return session.selectList("main.getMainProgram");
	}
	
	public List<ProgramVO> getProgramList (int p_class){
		return session.selectList("main.getMainProgramList", p_class);
	}
	

	public void insertBook(int[] bookArray) {
		session.insert("main.insertBook", bookArray);

	}

	public ProgramVO showBookResult(int pnumber) {
		return session.selectOne("main.showBookResult", pnumber);
	}
	
	public List<ProgramVO> checkMyBook(int mnumber) {
		return session.selectList("main.checkMyBook", mnumber);
	}
	
}