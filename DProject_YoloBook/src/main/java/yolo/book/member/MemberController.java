package yolo.book.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import yolo.book.program.BookVO;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	MemberService memberService;
	
	//1-1. 관리자모드: 미승인회원_화면
	@RequestMapping("/member2")
	public ModelAndView getLecturerBeforeApproval() {
		ModelAndView mv=new ModelAndView();
		List<MemberVO> member2list=memberService.getLecturerBeforeApproval();
		
		mv.addObject("member2list", member2list);
		mv.setViewName("admin/member2list");
		
		return mv;
	}

	//1-2. 관리자모드: 회원제 승인하기(update)
	@RequestMapping("/updatem2")
	public String approveMember2(int m_number) {
		memberService.approveMember2(m_number);
		return "admin/admin";
	}
	
	
	//2-1. 로그인 Get
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String getLogin() {
		return "member/login";
	}
	
	//2-2. 로그인 Post (＊member객체 Session ＊admin이동 ＊main이동 ＊register이동)
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView checkLogin(String id, String pw, Model model) {
		String loginResultMsg;
		ModelAndView mv=new ModelAndView();
		MemberVO member = memberService.checkLogin(id);
		int M_Status = member.getM_status();
		String getPw = member.getPw();
		
		if (member == null) { 
	
	//	 오류 미해결			
	//	loginResultMsg = "id없음";
	//	mv.addObject("loginResultMsg", loginResultMsg);
	//	mv.setViewName("member:/register");
		
		} 
		else if (member.getM_status()==0 && member.getPw().equals(pw)) {
			mv.setViewName("admin/admin");
			model.addAttribute("member", member); 

		}
		else if ((M_Status==1) && getPw.equals(pw)  
					|| (M_Status==2) && getPw.equals(pw)
						|| (M_Status==3) && getPw.equals(pw)) { 
			
			mv.setViewName("redirect:/main");
			model.addAttribute("member", member); 
		} 
		else if ((member.getM_status()==1 || member.getM_status()==2) && !member.getPw().equals(pw)) {
			loginResultMsg = "pw틀림";
			mv.addObject("loginResultMsg", loginResultMsg);
			mv.setViewName("member/login");
		}
		return mv;
	}

	
	//3-1. 회원가입 Get
	@RequestMapping(value="/register", method=RequestMethod.GET )
	public ModelAndView getRegister(String m_status) {
		System.out.println(m_status);

		ModelAndView mv = new ModelAndView();

		if (m_status != null) {
			mv.addObject("m_status", m_status);
		}

		mv.setViewName("member/register");

		return mv;
	}
	
	//3-2. 회원가입 Post
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String insertMember(MemberVO member) throws IOException {
		
		if(member.getM_status()==1) {
			memberService.insertMember(member);
			
		}
		else if(member.getM_status()==2) {
			MultipartFile multipartfile=member.getM_introduction_file();
			String filename=multipartfile.getOriginalFilename();
			member.setCertification_filename(filename);
			
			String savePath="C:/Users/student/Desktop/YoloBook/src/main/webapp/resources/images/certification/";
			File file=new File(savePath+filename);
			multipartfile.transferTo(file);
			
			memberService.insertMember(member);
			
		}
		
		return "redirect:/main";
	}
	
	//3-3. 회원가입 중복체크
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idcheck(String id) {
		String idcheck = memberService.checkId(id); //idcheck가 null인지 아닌지를 반환해서 ajax로 사용
		//System.out.println(idcheck); 
		return idcheck;
	}

	//4. 관리자모드: 전체회원조회 (등급명 join사용)
	@RequestMapping(value = "/memberlist", method = RequestMethod.GET)
	public ModelAndView getMemberList() {
		ModelAndView mv = new ModelAndView();
		
		List<MemberVO> memberlist = memberService.getMemberList();
		List<MemberVO> mgradeList = memberService.alterGradeList();

		mv.addObject("mgradeList",mgradeList);
		mv.addObject("memberlist", memberlist);
		mv.setViewName("member/memberlist");
		
		return mv;
	}	
	
	//5. 회원 예약정보 조회 (등급명 join사용)
	@RequestMapping(value="/myinfo", method=RequestMethod.GET)
	public ModelAndView getInfo(String m_number, String m_status) {
		ModelAndView mv = new ModelAndView();

		System.out.println("m_number 테스트=" + m_number);
		System.out.println("m_status 테스트=" + m_status);
		
		List<BookVO> booklist = memberService.getMybook(Integer.parseInt(m_number));
		String grade = memberService.alterGrade(Integer.parseInt(m_status));
		
		System.out.println("grade 테스트="+grade);
		
		mv.addObject("booklist",booklist);
		mv.addObject("grade",grade);
		mv.setViewName("member/myinfo");
		return mv;
	}
	
}
