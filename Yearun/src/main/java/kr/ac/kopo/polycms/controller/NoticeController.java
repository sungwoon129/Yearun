package kr.ac.kopo.polycms.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.polycms.model.Notice;
import kr.ac.kopo.polycms.model.Post;
import kr.ac.kopo.polycms.model.frecommend;
import kr.ac.kopo.polycms.model.nrecommend;
import kr.ac.kopo.polycms.service.NoticeService;
import kr.ac.kopo.polycms.util.MediaUtils;
import kr.ac.kopo.polycms.util.Pager;
import kr.ac.kopo.polycms.util.UploadFileUtils;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path="notice/";
/*final String fileuploadpath="d://upload//";*/
	final String fileuploadpath="/home//team8/upload/";
	
	@Autowired
	NoticeService service;

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
			
			
//			String path = service.profileUpload(file,request,response);
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
	
		
		@ResponseBody
		@RequestMapping("/recommend")
		int recommend(nrecommend recommend,HttpSession session,Model model,Post item) {
			
			int countRecommend = service.countRecommend(recommend.getId(),recommend.getNoticeCode());
			
			System.out.println(countRecommend);
			System.out.println(recommend.getId()+"/////"+recommend.getNoticeCode());
	/*		recommend.setId((String) session.getAttribute("user"));
			recommend.setFreeCode(item.getFreeCode());*/
			if(countRecommend == 0) {
			service.incRecommend(recommend.getNoticeCode(),recommend.getId());
		
			model.addAttribute("frecommend", recommend);
			
			
			}
		
			
			return countRecommend;
			
			
		}	
		
		
		
	@RequestMapping("/view")
	String view(long noticeCode,Model model) {
		service.incRef(noticeCode);
		
		Notice item=service.item(noticeCode);
		
		System.out.println(item.getUpFilename()+"<<<<<<<<Filename");
		
		model.addAttribute("item",item);
		
		return path+ "view";
	}
	
	
	@RequestMapping("/list")
	String list(Model model, Pager pager) {
		List<Notice> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	@RequestMapping(value="/add", method=RequestMethod.GET)
	String add() {
		return path + "add";
		
		
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	String add(Notice item, HttpSession session) {
		item.setId((String) session.getAttribute("user"));
		
		if(item.getUploadFile() != null) {
			String upFilename = item.getUploadFile().getOriginalFilename();
			try {
				item.getUploadFile().transferTo(new File(fileuploadpath + upFilename));
				
				item.setUpFilename(upFilename);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		service.add(item);
		
		return "redirect:list";
	}

	@RequestMapping(value="/update", method=RequestMethod.GET)
	String update(long noticeCode,Model model) {
		Notice item=service.item(noticeCode);
		
		model.addAttribute("item", item);
		
	
		
		return path+"update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	String update(Notice item) {
		
		
		if(item.getUploadFile() != null) {
			String upFilename = item.getUploadFile().getOriginalFilename();
			try {
				item.getUploadFile().transferTo(new File(fileuploadpath + upFilename));
				
				item.setUpFilename(upFilename);
				
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
	String delete(long noticeCode) {
		service.delete(noticeCode);
		
		return "redirect:list";
	}
}
