package com.nanum.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.eclipse.jdt.internal.compiler.impl.LongConstant;
import org.json.simple.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;

import net.sf.json.JSONArray;

public class SocketHandler extends TextWebSocketHandler {

   // 콘솔창에 찍는 로거
   private final Logger logger = LogManager.getLogger(getClass());
   // private Set<WebSocketSession> sessionSet = new
   // HashSet<WebSocketSession>();
   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();   
   private SimpleDateFormat dayTime = new SimpleDateFormat("yy-MM-dd hh:mm:ss");
   private HashMap<String, List<JSONObject>> locationchat = new HashMap<String, List<JSONObject>>();
   private JSONArray ja = new JSONArray();
   public SocketHandler() {
      // TextWebSocketHandler 생성
      super();
      this.logger.info("create SocketHandler instance!");
   }

   @Override
   // 연결이 끊어졌을때 리스트에서 remove를 통해 해당 session을 지운다
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      super.afterConnectionClosed(session, status);

      // sessionSet.remove(session);
      sessionList.remove(session);
      this.logger.info("remove session!");
   }

   @Override
   // 연결이 되었을때 리스트에 해당 sessiond을 입력한다
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      super.afterConnectionEstablished(session);
      System.out.println("여기는 들어왐");
      Member member = (Member) session.getAttributes().get("Member");
      
      if (member.getMember_level() >= 2) {            
         Location location = (Location) session.getAttributes().get("Location");         
         if (locationchat.containsKey(location.getLocation_name())) {            
            List<JSONObject> list = locationchat.get(location.getLocation_name());   
            ja.addAll(list);            
            System.out.println(ja.toString());
            session.sendMessage(new TextMessage((CharSequence)ja.toString()));
            ja.removeAll(list);
         }
         
         sessionList.add(session);

      } else {
         JSONObject jsonobj = new JSONObject();   
         jsonobj.put("email", "관리자");
         jsonobj.put("msg", "권한이 없어 채팅을 사용할수 없습니다 ");
                    

         session.sendMessage(new TextMessage((CharSequence)("["+jsonobj.toString())+"]")); 
      }

      this.logger.info("add session!");
   }

   @Override
   // 소켓을 통해 입력이 들어올때마다 실행
   public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
      super.handleMessage(session, message);
      Member member = (Member) session.getAttributes().get("Member");
      MemberNN membernn =(MemberNN) session.getAttributes().get("Membernn");
      Location location = (Location) session.getAttributes().get("Location");
      String msg = message.getPayload().toString();

      
      JSONObject jsonobj = new JSONObject();   
      jsonobj.put("email", member.getMember_email());
      jsonobj.put("msg", msg);
      jsonobj.put("img", membernn.getMember_image());
      jsonobj.put("id", member.getMember_id());
      jsonobj.put("time", dayTime.format(new Date(System.currentTimeMillis())));
      
      
      if (locationchat.get(location.getLocation_name()) == null) {
         locationchat.put(location.getLocation_name(), new ArrayList<JSONObject>());
      }
      
      
      if(locationchat.get(location.getLocation_name()).size()>=50){
         locationchat.get(location.getLocation_name()).remove(0);
      }
      locationchat.get(location.getLocation_name()).add(jsonobj);   
      
      // 입력이 들어온 해당 세션의 message를 다른 사람에게 보내준다
      for (WebSocketSession sess : sessionList) {         
         
         Location otherlocation = (Location) sess.getAttributes().get("Location");         
         if (location.getLocation_name().equals(otherlocation.getLocation_name())) {
            sess.sendMessage(new TextMessage((CharSequence)("["+jsonobj.toString())+"]"));            
         }
      }
      this.logger.info("receive message:" + message.getPayload());
   }

   @Override
   public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
      this.logger.error("web socket error!", exception);
   }

   @Override
   public boolean supportsPartialMessages() {
      this.logger.info("call method!");

      return super.supportsPartialMessages();
   }

}