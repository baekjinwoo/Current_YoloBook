package yolo.book.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yolo.book.program.ProgramVO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO dao;
	

	@Override
	public List<ProgramVO> getMainProgramList(int p_class) {
		return dao.getProgramList(p_class);
	}

	public void insertBook(int[] bookArray) {
		dao.insertBook(bookArray);
	}

	public ProgramVO showBookResult(int pnumber) {
		return dao.showBookResult(pnumber);
		
	}

	@Override
	public List<ProgramVO> checkMyBook(int mnumber) {
		return dao.checkMyBook(mnumber);
	}

	@Override
	public List<ProgramVO> getMainProgram() {
		return dao.getProgram();
	}
}