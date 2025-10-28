package com.exam.gagi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.exam.gagi.model.Member;

/**
 * 관리자 권한을 체크하는 인터셉터.
 * 비로그인 사용자는 로그인 페이지로, 일반 사용자는 홈페이지로 리다이렉트합니다.
 */
public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 1. 비로그인 사용자 확인
        if (loginUser == null) {
            System.out.println("INFO: AdminInterceptor가 비로그인 사용자의 접근을 감지했습니다. URI: " + request.getRequestURI());
            response.sendRedirect(request.getContextPath() + "/login");
            return false; // 컨트롤러 실행 중단
        }

        // 2. 관리자 권한 확인 (userType이 "admin"이라고 가정)
        if (!"admin".equals(loginUser.getUserType())) {
            // 일반 사용자인 경우, 콘솔에 로그를 남기고 홈페이지로 리다이렉트
            System.out.println("INFO: AdminInterceptor가 일반 사용자의 관리자 페이지 접근을 감지했습니다. User: " + loginUser.getEmail());
            response.sendRedirect(request.getContextPath() + "/");
            return false; // 컨트롤러 실행 중단
        }

        // 관리자인 경우, 요청을 계속 진행
        return true;
    }
}
