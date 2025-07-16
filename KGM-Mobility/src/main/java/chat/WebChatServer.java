package chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import jakarta.servlet.http.HttpServlet;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.ServerEndpoint;

// 다음 "프로젝트/webChatServer"  사이트로 연결시 동작한다.
@ServerEndpoint("/webChatServer")
public class WebChatServer extends HttpServlet {
  private static final long serialVersionUID = 1L;
  // 클라이언트 관리 맵
  private static Map<Session,ChatClient> mClient 
    = Collections.synchronizedMap(new HashMap<Session, ChatClient>());
  
  // 메시지 처리 함수
  @OnMessage
  public void onMessage(String message, Session session) throws IOException {
    String userName = mClient.get(session).getName();
    System.out.println(userName + " : " + message);
    
    synchronized (mClient) {
      Iterator<Session> it = mClient.keySet().iterator();
      while(it.hasNext()){
        Session currentSession = it.next();
        if(!currentSession.equals(session)){
          currentSession.getBasicRemote().sendText(userName + " : " + message);
        }
      }
    }    
  }
  
  // 소켓 연결 함수
  @OnOpen
  public void onOpen(Session session){
    ChatClient client = new ChatClient();
    client.setName("user"+(int)(Math.random()*1000));     
    System.out.println(session + " connect");
    
    mClient.put(session, client);
	/*
	 * sendNotice(client.getName() + "님이 입장하셨습니다. 현재 사용자 " + mClient.size() + "명");
	 */
    sendNotice(client.getName() + "님이 입장하셨습니다.");
    sendNotice("KGM 소통서버에 오신 것을 환영합니다.");
    sendNotice("현재 인원은"+ mClient.size() + "명 입니다.");
    sendNotice("문의는 게시판 이용 부탁 드립니다.");
  }
  
  // 전송 함수
  public void sendNotice(String message) {
    System.out.println("KGM 챗봇 : " + message);
    
    synchronized (mClient) {
      Iterator<Session> it = mClient.keySet().iterator();
      while(it.hasNext()){
        Session currentSession = it.next();
        try {
          currentSession.getBasicRemote().sendText("KGM 챗봇 : " + message);
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  }

  // 소켓 닫기 함수
  @OnClose
  public void onClose(Session session) {
    String userName = mClient.get(session).getName();
    mClient.remove(session);
    sendNotice(userName + "님이 퇴장하셨습니다. 현재 사용자 " + mClient.size() + "명");
  }
}

// 클라이언트 정보를 갖는다.
class ChatClient {
  private String id;
  private String host_ip;
  private String name;
  
  public String getId() {  return id;  }
  public void setId(String id) {  this.id = id;  }
  public String getHost_ip() {  return host_ip;  }
  public void setHost_ip(String host_ip) {  this.host_ip = host_ip;  }
  public String getName() {  return name;  }
  public void setName(String name) {  this.name = name;  }  
}
