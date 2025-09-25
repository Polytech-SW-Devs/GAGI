package com.exam.gagi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.gagi.model.Reply;
import com.exam.gagi.service.ReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	private final ReplyService replyService;
	
	@Autowired
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	// 댓글 작성
	@PostMapping("/add")
	public String addReply(@ModelAttribute Reply reply) {
		replyService.addReply(reply);
		return "redirect:/" + reply.getBoardType() + "/" + reply.getPostId();
	}
	
	// 댓글 목록
	@GetMapping("/list/{boardType}/{postId}")
	public String listReplies(@PathVariable String boardType,
							  @PathVariable int postId,
							  Model model) {
		List<Reply> replies = replyService.getRepliesByPost(postId, boardType);
		model.addAttribute("replies", replies);
		return "reply/list";
	}
	
	// 댓글 삭제
	@PostMapping("/delete/{id}")
	public String deleteReply(@PathVariable int id,
							  @RequestParam int userId,
							  @RequestParam String boardType,
							  @RequestParam int postId) {
		replyService.deleteReply(id, userId);
		return "redirect:/" + boardType + "/" + postId;
	}
}
