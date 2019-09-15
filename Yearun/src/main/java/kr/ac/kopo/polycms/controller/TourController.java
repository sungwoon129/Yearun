package kr.ac.kopo.polycms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/tour")
public class TourController {

	final String path = "tour/";
	
	@RequestMapping("/flower")
	public String flower() {
		return path+"flower";
	}
	
	@RequestMapping("/water")
	public String water() {
		return path+"water";
	}
	
	
	@RequestMapping("/mountain")
	public String mountain() {
		return path+"mountain";
	}
	
	@RequestMapping("/festival")
	public String festival() {
		return path+"festival";
	}
}
