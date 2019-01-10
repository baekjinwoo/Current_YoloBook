package yolo.book.program;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProgramServiceImpl implements ProgramService{
	@Autowired
	ProgramDAO dao;
	
	@Override
	public List<ProgramVO> getProgramList() {
		return dao.getProgramList();
	}

	@Override
	public void deleteProgram(String number) {
		dao.deleteProgram(number);
	}

	@Override
	public ProgramVO getProgram(int p_number) {
		return dao.getProgram(p_number);
	}

	@Override
	public void payProgram(int m_number, int p_number, String payinfo) {
		dao.payProgram(m_number, p_number, payinfo);
	}

	@Override
	public List<ProgramVO> getRandomProgram() {
		return dao.getRandomProgram();
	}

	@Override
	public List<ProgramVO> getProgramBeforeApproval() {
		return dao.getProgramBeforeApproval();
	}

	@Override
	public void insertRegisterProgram(ProgramVO program) {
		dao.insertRegisterProgram(program);
	}
	
	@Override
	public void approveProgram(int p_number) {
		dao.approveProgram(p_number);
	}

	@Override
	public List<ProgramVO> alterGradeList() {
		return dao.alterGradeList();
	}
}
