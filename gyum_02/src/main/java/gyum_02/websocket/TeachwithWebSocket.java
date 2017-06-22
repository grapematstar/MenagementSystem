package gyum_02.websocket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;;



public class TeachwithWebSocket extends TextWebSocketHandler{

	private Map<String, WebSocketSession> user=new ConcurrentHashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		user.put(session.getId(),session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		log(session.getId()+"연결종료");
		user.remove(session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log(session.getId()+" : "+message.getPayload());
		for(WebSocketSession s:user.values()){
			s.sendMessage(message);
			log(s.getId()+"에 메세지 발송:"+message.getPayload());
		}
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		log(session.getId()+" error : "+ exception.getMessage());
	}
	
	private void log(String logmsg){
		System.out.println(new Date()+":"+logmsg);
	}
}
