package kr.ac.kopo.polycms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/mountain")
public class MountainController {

	final String path = "tour/";
	
	@RequestMapping("/daeguanryung")
	public String Daegu() {
		return path+"tourDaeguanryung";
	}
}
