package yolo.book.program;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yolo.book.member.MemberService;

@Controller
public class ProgramController {
	 @Autowired
	 ProgramService programService;
	 
	 @Autowired
	 MemberService memberService;

	@Autowired
	SqlSession session;
	
	// 0. 관리자모드: 메인화면 ( login => admin )
	@RequestMapping(value="/admin")
	public String getAdmin(){
		return "program/admin";
	}
	
	//1-1. 관리자모드: 미승인강좌_화면
	@RequestMapping("/program2")
	public ModelAndView getProgramBeforeApproval() {
		
		ModelAndView mv=new ModelAndView();
		List<ProgramVO> listOfProgramBeforeApproval=programService.getProgramBeforeApproval();
		
		mv.addObject("listOfProgramBeforeApproval", listOfProgramBeforeApproval);
		mv.setViewName("admin/programBeforeApproval");
		
		return mv;
	}

	//1-2. 관리자모드: 미승인강좌_승인하기(update)
	@RequestMapping("/approveProgram")
	public String approveProgram(int p_number) {
		programService.approveProgram(p_number);
		return "admin/admin";
	}

	//2-1 . 승인강사: 프로그램 등록 GET
	@RequestMapping(value="/registerprogram",method=RequestMethod.GET)
	public String getRegisterProgram(){
		return "program/registerprogram";
	}

	//2-2 . 승인강사: 프로그램 등록 POST
	@RequestMapping(value="/registerprogram",method=RequestMethod.POST)
	public String insertRegisterProgram(String p_class, ProgramVO program) throws IllegalStateException, IOException{
			MultipartFile thumbnail_file=program.getP_thumbnail_file();
			MultipartFile syllabus_file=program.getP_syllabus_file();

			String syllabus_filename=syllabus_file.getOriginalFilename();
			String thumbnail_filename=thumbnail_file.getOriginalFilename();
			
			program.setP_thumbnail_filename(thumbnail_filename);
			program.setP_syllabus_filename(syllabus_filename);
			
			String savePathForThumbnail= null;
			String savePathForSyllabus="C:/Users/student/Desktop/YoloBook/src/main/webapp/resources/images/syllabus/";
			
			int p_classnum=Integer.parseInt(p_class);
			
			if(p_classnum==1){ //만약에 radio가 1이면 경로설정
				savePathForThumbnail="C:/Users/student/Desktop/YoloBook/src/main/webapp/resources/main_bootstrap/img/portfolio/cake/";
			}
			else if(p_classnum==2){
				savePathForThumbnail="C:/Users/student/Desktop/YoloBook/src/main/webapp/resources/main_bootstrap/img/portfolio/jasu/";
			}
			else if(p_classnum==3){
				savePathForThumbnail="C:/Users/student/Desktop/YoloBook/src/main/webapp/resources/main_bootstrap/img/portfolio/leather/";
			}
			else if(p_classnum==4){
				savePathForThumbnail="C:/Users/student/Desktop/YoloBook/src/main/webapp/resources/main_bootstrap/img/portfolio/art/";
			}

			File file1=new File(savePathForThumbnail+thumbnail_filename);
			File file2=new File(savePathForSyllabus+syllabus_filename);

			thumbnail_file.transferTo(file1);
			syllabus_file.transferTo(file2);
		
			programService.insertRegisterProgram(program);
		
		return "redirect:/main";
	}

	//3. 관리자모드: 프로그램 전체조회
	@RequestMapping(value = "/pselect", method = RequestMethod.GET)
	public ModelAndView getProgramList() {
		
		ModelAndView mv=new ModelAndView();
		List<ProgramVO> programlist = programService.getProgramList();
		List<ProgramVO> pgradeList = programService.alterGradeList();

		mv.addObject("pgradeList", pgradeList);
		mv.addObject("programlist", programlist);
		mv.setViewName("program/select");
		
		return mv;
	}

	//4-1. 관리자모드: 프로그램 삭제GET
	@RequestMapping(value = "/pdelete", method = RequestMethod.GET)
	public String deleteProgram() {
		return "program/delete"; 
	}

	//4-2. 관리자모드: 프로그램 삭제POST
	@RequestMapping(value = "/pdelete", method = RequestMethod.POST)
	public String deleteProgram(String number) {
		programService.deleteProgram(number);
		return "redirect:/pselect"; 
	}

	//5-1. 관리자모드: 프로그램 수정GET
	@RequestMapping(value = "/pupdate", method = RequestMethod.GET)
	public String UpdateProgram() {
		return "program/update";
	}

	//5-2. 관리자모드: 프로그램 수정POST
	@RequestMapping(value = "/pupdate", method = RequestMethod.POST)
	public ModelAndView UpdateProgramResult(String pnumber1, String price1, String time1, String time2) {

		ModelAndView mv = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();

		map.put("pnumber", pnumber1);
		map.put("price", price1);
		map.put("starttime", time1);
		map.put("endtime", time2);

		session.update("program.update", map);
		mv.setViewName("redirect:/pinsert");
		return mv;
	}
	
	//6-1. 프로그램 예약화면
	@RequestMapping("/book") //4. 프로그램 예약확인
	public ModelAndView bookProgram(int p_number){
		ModelAndView mv = new ModelAndView();

		ProgramVO program = programService.getProgram(p_number); 
		//System.out.println(program);
		
		mv.addObject("program", program);
		mv.setViewName("program/book");
		
		return mv;
	}
	
	//6-2. 프로그램 예약결과 (결제 & insert)
	@RequestMapping("/pay") //5. 프로그램 예약완료
	public String payProgram(int m_number, int p_number, String payinfo){
		System.out.println("m_number:"+m_number);
		System.out.println("p_number:"+p_number);
		System.out.println("payinfo:"+payinfo);
		
		programService.payProgram(m_number, p_number, payinfo);
		return "program/pay";
		
	}
}
