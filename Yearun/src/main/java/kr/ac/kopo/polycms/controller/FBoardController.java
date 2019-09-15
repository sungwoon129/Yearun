package kr.ac.kopo.polycms.controller;
import java.io.File;
import java.io.FileInputStream;

import java.io.IOException;
import java.io.InputStream;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.frecommend;
import kr.ac.kopo.polycms.service.BoardService;
import kr.ac.kopo.polycms.util.MediaUtils;
import kr.ac.kopo.polycms.util.Pager;
import kr.ac.kopo.polycms.util.UploadFileUtils;

@Controller
@RequestMapping("/freeboard")
public class FBoardController {
	final String path="freeboard/";
//	final String realuploadpath="d://upload//";
	final String realuploadpath="/home/team8/upload/";
	
	@Autowired
	BoardService service;
	UUID uid = UUID.randomUUID();
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	

//시작 107	
	//써머노트
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	
	@RequestMapping("/imageUpload")
	@ResponseBody
	ResponseEntity<String> profileUpload(MultipartFile file,HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());



		
		

		
		
//		String path = service.profileUpload(file,request,response);
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
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
	
	
	
	//답글이다
	@RequestMapping(value="/replyadd", method=RequestMethod.GET)
	String reply(Model model,Post item,int originNo,int groupOrd,int groupLayer) {
	
		
		model.addAttribute("item", item);
		
		
		return path + "replyadd";

		
	}
	@RequestMapping(value="/replyadd",method=RequestMethod.POST)
	String replyadd(Post item, HttpSession session) {
		item.setId((String) session.getAttribute("user"));
		
		if(item.getAttach() != null) {
			
			String freePhotoA = item.getAttach().getOriginalFilename();
		
			try {
				item.getAttach().transferTo(new File(realuploadpath + freePhotoA));
				
				item.setFreePhotoA(freePhotoA);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		service.replyadd(item);
		
		
		return "redirect:list";
	}
	
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping("/checkRecommend")
	int checkRecommend(frecommend recommend) {
		int countRecommend = service.countRecommend(recommend.getId(),recommend.getFreeCode());
		return countRecommend;
	}
	
	
	
	
	
	//중복추천 방지 AJAX
	@ResponseBody
	@RequestMapping("/recommend")
	int recommend(frecommend recommend,HttpSession session,Model model,Post item) {
		
		int countRecommend = service.countRecommend(recommend.getId(),recommend.getFreeCode());
		
		System.out.println(countRecommend);
		System.out.println(recommend.getId()+"/////"+recommend.getFreeCode());
/*		recommend.setId((String) session.getAttribute("user"));
		recommend.setFreeCode(item.getFreeCode());*/
		if(countRecommend == 0) {
		service.incRecommend(recommend.getFreeCode(),recommend.getId());
	
		model.addAttribute("countRecommend", countRecommend);
		
		
		}
	
		
		return countRecommend;
		
		
	}
	
	
	@RequestMapping("/view")
	String view(long freeCode,Model model) {
		service.incRef(freeCode);
		
		Post item=service.item(freeCode);
		int totalComment = service.countComment(freeCode);
		item.setTotalComment(totalComment);
		model.addAttribute("totalComment", totalComment);
		model.addAttribute("item",item);
		
		return path+ "view";
	}
	
	
	@RequestMapping("/list")
	
	String list(Model model, Pager pager) {
		
		List<Post> list = service.list(pager);
		List<Notice> nlist = service.nlist();
		 
		
		model.addAttribute("perPageOption", pager.getPerPageOption());
		model.addAttribute("list", list);
		model.addAttribute("nlist",nlist);
		
		
		return path + "list";
	}
	@RequestMapping(value="/add", method=RequestMethod.GET)
	String add() {
		return path + "add";
		
		
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	String add(Post item, HttpSession session) {
		item.setId((String) session.getAttribute("user"));
		
		
		if(item.getAttach() != null) {
			String freePhotoA = item.getAttach().getOriginalFilename();
				
				
			
			try {
				
				item.getAttach().transferTo(new File(realuploadpath  +freePhotoA));
				
				item.setFreePhotoA(freePhotoA);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
		
		service.add(item);
		
		return "redirect:list";
	}

	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(long freeCode,Model model) {
		Post item=service.item(freeCode);
		
		model.addAttribute("item", item);
		
	
		
		return path+"update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	String update(Post item) {
		
		
		if(item.getAttach() != null) {
			
			String freePhotoA = item.getAttach().getOriginalFilename();
			try {
				
				
				item.getAttach().transferTo(new File(realuploadpath + freePhotoA));
				
				item.setFreePhotoA(freePhotoA);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
			service.update(item);
		
		
		return "redirect:list";
		
	}
	
	@RequestMapping("/delete")
	String delete(long freeCode) {
		service.delete(freeCode);
		
		return "redirect:list";
	}
}
