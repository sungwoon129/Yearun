package kr.ac.kopo.polycms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.RPost;
import kr.ac.kopo.polycms.model.User;
import kr.ac.kopo.polycms.model.frecommend;
import kr.ac.kopo.polycms.model.rrecommend;
import kr.ac.kopo.polycms.service.BoardService;
import kr.ac.kopo.polycms.service.RBoardService;
import kr.ac.kopo.polycms.util.MediaUtils;
import kr.ac.kopo.polycms.util.Pager;
import kr.ac.kopo.polycms.util.RUploadFileUtils;
import kr.ac.kopo.polycms.util.UploadFileUtils;

@Controller
@RequestMapping("/reviewboard")
public class RBoardController {
	final String path="reviewboard/";
//	final String realuploadpath="d://upload//";
	final String realuploadpath="/home/team8/upload/";
	
	@Autowired
	RBoardService rservice;
	UUID uid = UUID.randomUUID();
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	
	@RequestMapping("/imageUpload")
	@ResponseBody
	ResponseEntity<String> profileUpload(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		

		
		
//		String path = service.profileUpload(file,request,response);
		return new ResponseEntity<>(RUploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}

	
	
	@ResponseBody
	@RequestMapping(value="/sample/upload/displayFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		logger.info("File name: " + fileName);
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			
		
			
			
			
			in = new FileInputStream(uploadPath + fileName);
			
			
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}// else
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		
		return entity;
	}// displayFile
//시작 54
	
	
	
	@ResponseBody
	@RequestMapping("/checkRecommend")
	int checkRecommend(rrecommend recommend) {
		int countRecommend = rservice.countRecommend(recommend.getId(),recommend.getReviewCode());
		return countRecommend;
	}
	
	@ResponseBody
	@RequestMapping("/recommend")
	int recommend(rrecommend recommend,HttpSession session,Model model,RPost item) {
		
		int countRecommend = rservice.countRecommend(recommend.getId(),recommend.getReviewCode());
		
		System.out.println(countRecommend);
		System.out.println(recommend.getId()+"/////"+recommend.getReviewCode());
/*		recommend.setId((String) session.getAttribute("user"));
		recommend.setFreeCode(item.getFreeCode());*/
		if(countRecommend == 0) {
		rservice.incRecommend(recommend.getReviewCode(),recommend.getId());
	
		model.addAttribute("countRecommend", countRecommend);
		
		
		}
	
		
		return countRecommend;
		
		
	}
	
	  

	
	
	
	
	
	
	
	@RequestMapping("/view")
	String view(long reviewCode,Model model) {
		rservice.incRef(reviewCode);
		
		RPost item=rservice.item(reviewCode);
		int totalComment = rservice.countComment(reviewCode);
		
		item.setTotalComment(totalComment);
		model.addAttribute("totalComment", totalComment);
		model.addAttribute("item",item);
		
		return path+ "view";
	}
	
	@RequestMapping("/list")
	
		
	String list(Model model, Pager pager) {
		List<RPost> list = rservice.list(pager);
		
		model.addAttribute("list", list);
		
		
		return path + "list";
	}
	@RequestMapping(value="/add", method=RequestMethod.GET)
	String add() {
		return path + "add";
		
		
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	String add(RPost item, HttpSession session) {
		item.setId((String) session.getAttribute("user"));
		
		if(item.getAttach() != null) {
			String reviewPhotoA = item.getAttach().getOriginalFilename();
			
			try {
				item.getAttach().transferTo(new File(realuploadpath + reviewPhotoA));
				
				item.setReviewPhotoA(reviewPhotoA);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		rservice.add(item);
		
		return "redirect:list";
	}

	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(long reviewCode,Model model) {
		RPost item=rservice.item(reviewCode);
		
		model.addAttribute("item", item);
		
	
		
		return path+"update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	String update(RPost item) {
		
		
		if(item.getAttach() != null) {
			String reviewPhotoA = item.getAttach().getOriginalFilename();
			
			try {
				item.getAttach().transferTo(new File(realuploadpath + reviewPhotoA));
				
				item.setReviewPhotoA(reviewPhotoA);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
			rservice.update(item);
		
		
		return "redirect:list";
		
	}
	
	@RequestMapping("/delete")
	String delete(long reviewCode) {
		rservice.delete(reviewCode);
		
		return "redirect:list";
	}
}
