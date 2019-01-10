package yolo.book.main;

import java.util.List;

import yolo.book.program.ProgramVO;

public interface MainService {
	
	public List<ProgramVO> getMainProgram();
	public List<ProgramVO> getMainProgramList(int p_class);
	public void insertBook(int[] bookArray);
	public ProgramVO showBookResult(int pnumber);
	public List<ProgramVO> checkMyBook(int mnumber);
	
}