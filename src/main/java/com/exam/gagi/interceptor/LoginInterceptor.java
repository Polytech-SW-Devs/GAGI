package com.exam.gagi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 로그인 여부를 체크하는 인터셉터.
 * 세션에 "loginUser" 속성이 없으면 로그인 페이지로 리다이렉트합니다.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        // 현재 세션을 가져옴
        HttpSession session = request.getSession();
        
        // 세션에서 "loginUser" 속성을 확인
        Object loginUser = session.getAttribute("loginUser");

        if (loginUser == null) {
            // 비로그인 사용자인 경우, 콘솔에 로그를 남기고 로그인 페이지로 리다이렉트
            System.out.println("INFO: LoginInterceptor가 비로그인 사용자의 접근을 감지했습니다. URI: " + request.getRequestURI());
            response.sendRedirect(request.getContextPath() + "/login");
            return false; // 컨트롤러의 실행을 중단
        }

        // 로그인된 사용자인 경우, 요청을 계속 진행
        return true;
    }
}
