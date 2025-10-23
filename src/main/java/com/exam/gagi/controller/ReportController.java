package com.exam.gagi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/report")
public class ReportController {

    // 신고 목록 페이지로 이동
    @GetMapping("/list")
    public String list() {
        return "report/list";  // /WEB-INF/views/report/list.jsp 로 이동
    }
}
