package com.nanum.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.nanum.domain.Location;
import com.nanum.domain.Member;
import com.nanum.domain.MemberNN;
  
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
  
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Map<String, Object> attributes) throws Exception {
  
        System.out.println("Before Handshake");
          
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
  
        HttpServletRequest req =  ssreq.getServletRequest();
 
        /*String userId = req.getParameter("userid");
        System.out.println("param, id:"+userId);
        attributes.put("userId", userId);*/
  
        // HttpSession 에 저장된 이용자의 아이디를 추출하는 경우
        Member member = (Member)req.getSession().getAttribute("Member");
        MemberNN membernn=(MemberNN)req.getSession().getAttribute("Membernn");
        Location location=(Location)req.getSession().getAttribute("Location");
        attributes.put("Member", member);
        if(membernn!=null){
        	attributes.put("Membernn", membernn); 
        	attributes.put("Location",location);
        }
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
  
}