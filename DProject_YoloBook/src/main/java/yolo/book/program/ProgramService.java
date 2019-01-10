package yolo.book.program;

import java.util.List;

public interface ProgramService {
	public ProgramVO getProgram(int p_number); 
	public List<ProgramVO> getProgramList();
	public void deleteProgram(String number);
	
	public void payProgram(int m_number, int p_number, String payinfo);
	public List<ProgramVO> getRandomProgram();
	public List<ProgramVO> getProgramBeforeApproval();
	public void insertRegisterProgram(ProgramVO program);
	public void approveProgram(int p_number);

	public List<ProgramVO> alterGradeList();

}
