package yolo.book.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yolo.book.program.ProgramService;
import yolo.book.program.ProgramVO;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	
	@Autowired
	ProgramService programService;
	
	//1. main화면-랜덤조회
	@RequestMapping("/main")
	public ModelAndView getMainPage() {
		ModelAndView mv=new ModelAndView();
		List<ProgramVO> randomprogramlist= new ArrayList<ProgramVO>();
		
		randomprogramlist.addAll(programService.getRandomProgram());
		System.out.println("test");
		for(ProgramVO i:randomprogramlist){
			System.out.println(i.getP_number());
		}
		mv.addObject("randomprogramlist", randomprogramlist);
		mv.setViewName("main/main");
		
		return mv;
	}
	
	//2. program화면-4가지
	@RequestMapping(value="/program", method=RequestMethod.GET)
	public ModelAndView getProgram1(String p_class) {
		ModelAndView mv=new ModelAndView();
		List<ProgramVO> programlist=mainService.getMainProgramList(Integer.parseInt(p_class));
		mv.addObject("programlist", programlist);
		mv.setViewName("main/program");

		return mv;
	}
	
	//3. logout화면
	@RequestMapping("/logout")
	public String getLogout(HttpSession session) {
		session.setAttribute("member", null);
		return "redirect:/main";
	}
		
	//4. 홈페이지 소개화면
	@RequestMapping("/intro")
	public String getIntro(){
		return "main/intro";
	}
	
	//5. 사업장 위치조회 (google-map)
	@RequestMapping("/location")
	public String getLocation(){
		return "main/location";
	}
}