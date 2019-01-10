package yolo.book.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class ChatWebSocketController {
	@RequestMapping("/chat") 
	public String chat(String id){
		System.out.println(getClass().getName()+" : chat 메소드 ");
		
		
		return "main/websocket"; 
	}
}
