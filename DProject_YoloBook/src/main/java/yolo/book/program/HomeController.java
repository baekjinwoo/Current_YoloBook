package yolo.book.program;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	//1. 실행 첫화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/main"; //jsp (x) url-mapping(o)
	}
}
