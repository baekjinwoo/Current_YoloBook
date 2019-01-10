package yolo.book.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

public class ChatWebSocketHandler implements WebSocketHandler {
	List<WebSocketSession> list = new ArrayList<WebSocketSession>(); 
	
	@Override
	public void afterConnectionClosed(WebSocketSession arg0, CloseStatus arg1) throws Exception { 
		list.remove(arg0);
		
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession arg0) throws Exception { 
		list.add(arg0);
	
	}
	
	@Override 
	public void handleMessage(WebSocketSession arg0, WebSocketMessage<?> arg1) throws Exception { 
		String msg = (String)arg1.getPayload();
		for(WebSocketSession socket : list){ 
			WebSocketMessage<String> sendmsg  = new TextMessage(msg);
			socket.sendMessage(sendmsg);
		}
	}
	@Override
	public void handleTransportError(WebSocketSession arg0, Throwable arg1) throws Exception { //필요없음
		
	}

	@Override
	public boolean supportsPartialMessages() { //필요없음
		return false;
	}

}
