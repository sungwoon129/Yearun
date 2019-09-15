package kr.ac.kopo.polycms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {

	
	@RequestMapping("/question")
	String question() {
		return "question";
	}
}
