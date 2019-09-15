package kr.ac.kopo.polycms.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.polycms.model.Area;
import kr.ac.kopo.polycms.model.Bucket;
import kr.ac.kopo.polycms.model.BucketList;
import kr.ac.kopo.polycms.model.Hotel;
import kr.ac.kopo.polycms.model.Planner;
import kr.ac.kopo.polycms.model.Restaurant;
import kr.ac.kopo.polycms.model.items;
import kr.ac.kopo.polycms.service.MapService;

@Controller
@RequestMapping("/maps")
public class MapController {

	@Autowired
	MapService service;
	/*final String realuploadpath="d://upload//";*/
	final String realuploadpath="/home/team8/upload/";
	final String path = "area/";

	@RequestMapping("/add")
	String view() {
		return path + "add";
	}

	// 달력에서 이미지 저장 버튼 눌렀을경우 실행 버킷에 있는값 삭제
	@RequestMapping("/bucketDelete")
	public String bucketDelete(HttpSession session) {
		String id = (String) session.getAttribute("user");
		System.out.println("bucketDelete메소드의 id값->" + id);
		service.bucketDelete(id);

		return "redirect:/";
	}

	@RequestMapping("/AreaSelect")
	@ResponseBody
	public HashMap<String, Object> AreaSelect() {

		HashMap<String, Object> map = new HashMap<String, Object>();

		// 위경도 구하기
		List<Area> Location = service.AreaSelect();
		map.put("list", Location);
		// 전체값 불러오기
		List<Area> area = service.Area();
		map.put("area", area);
		List<Hotel> hotel = service.hotel();
		map.put("hotel", hotel);
		List<Restaurant> restaurant = service.restaurant();
		map.put("food", restaurant);

		return map;
	}

	@RequestMapping(value = "/BucketAdd", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void add(@ModelAttribute BucketList b, HttpSession session ) {

		System.out.println("리스트" + b.getBucketList());
		Bucket b1 = new Bucket();
		b1.setId((String) session.getAttribute("user"));
		service.add(b);

	}
	
	//달력에서 save 버튼 클릭시 실행 detail 테이블에 선택한 날짜와 text id 저장
	@RequestMapping(value ="/planDetailAdd", method = { RequestMethod.GET, RequestMethod.POST })
	public void planDetailAdd(@ModelAttribute items item, HttpSession session , Planner planner) {
		String id = (String) session.getAttribute("user"); 
		service.planDetailAdd(item,id);
		System.out.println("planDetailAdd Map컨트롤러 실행");
	}
	
	//달력화면에 여행지 등록 페이지에서 선택한 값들 출력
	@RequestMapping(value = "/external-dragging", method = RequestMethod.GET)
	public String externalDragging(Model model, HttpSession session) {
		String id = (String) session.getAttribute("user");

		List<Hotel> hotelList = service.hotelList(id);
		List<Restaurant> restaurantList = service.restaurantList(id);

		model.addAttribute("hotelList", hotelList);
		model.addAttribute("restaurantList", restaurantList);
		
		return path + "external-dragging";
	}

	//달력에서 save 버튼 클릭시 실행
	//버킷 테이블의 값 삭제 , 서버와 db에 캡쳐된 화면 저장
	/** * 캡쳐된 화면 서버 저장 * @param request * @return * @throws Exception */
	@RequestMapping(value = "/imageCreate")
	public ModelAndView createImage(HttpServletRequest request , Planner planner, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("user");
		// 버킷테이블에 값 삭제
		service.bucketDelete(id);
		//플래너에 들어갈 지역번호 String으로 받아와서 int로 형변환 하여준다.
		int areaCode =   Integer.parseInt(request.getParameter("areaCode")) ;
			
		System.out.println("createImage 메서드 의 areaCode값"+areaCode);
		
		
		String binaryData = request.getParameter("imgSrc");
		FileOutputStream stream = null;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("form/index");
		try {
		System.out.println("binary file " + binaryData);
		if (binaryData == null || binaryData == "") {
		System.out.println("binaryData가 null일 경우"+binaryData);
			throw new Exception();
		}

		binaryData = binaryData.replaceAll("data:image/png;base64,", "");
		
		
		byte[] file = Base64.getDecoder().decode(binaryData.getBytes());
		System.out.println("file :::::::: " + file + " || " + file.length);
		String fileName = UUID.randomUUID().toString();
		
		
		File createPath = new File(realuploadpath);//폴더가 없으면 위의 realuploadpath에 있는 경로의 이름으로 생성해준다.
		if(!createPath.exists()) {
			createPath.mkdirs();
			System.out.println("폴더 생성 성공.");
		}
	
		stream = new FileOutputStream(realuploadpath+ fileName + ".png");//파일 경로 잡고 거기에 파일이름을 넣고 png로 설정.
		stream.write(file);
		stream.close();
		
		planner.setAreaNo(areaCode);
		planner.setMyPhoto(fileName+".png");
		planner.setId(id);
		
		//db에 파일명 저장
		service.imgUpload(planner);
		
		
		System.out.println("파일 작성 완료 파일 이름은 : "+fileName);
		mav.addObject("msg", "ok");
			
	
	
		
		} catch (Exception e) {
		System.out.println("파일이 정상적으로 넘어오지 않았습니다");
		mav.addObject("msg", "no");
		return mav;
		} finally {
		stream.close();
		}
		return mav;

		}

}
