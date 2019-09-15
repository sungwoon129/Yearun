package kr.ac.kopo.polycms.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Post {
	long freeCode;
	String id;
	String freeTitle;
	String freeContext;
	String thumbnail;
	
	
	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	long ref;
	private int originNo;
	private int groupOrd;
	private int groupLayer;
	private int totalComment;
	private String attachPath; 
    private MultipartFile upload; 
    private String filename; 
   




	

	
	
	 

	

	public String getAttachPath() {
		return attachPath;
	}

	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}


	public int getTotalComment() {
		return totalComment;
	}

	public void setTotalComment(int totalComment) {
		this.totalComment = totalComment;
	}

	public int getOriginNo() {
		return originNo;
	}

	public void setOriginNo(int originNo) {
		this.originNo = originNo;
	}

	public int getGroupOrd() {
		return groupOrd;
	}

	public void setGroupOrd(int groupOrd) {
		this.groupOrd = groupOrd;
	}

	public int getGroupLayer() {
		return groupLayer;
	}

	public void setGroupLayer(int groupLayer) {
		this.groupLayer = groupLayer;
	}

	/*//photo_uploader.html페이지의 form태그내에 존재하는 file 태그의 name명과 일치시켜줌
    private MultipartFile Filedata;
    //callback URL
    private String callback;
    //콜백함수??
    private String callback_func;
 
    public MultipartFile getFiledata() {
        return Filedata;
    }
 
    public void setFiledata(MultipartFile filedata) {
        Filedata = filedata;
    }
 
    public String getCallback() {
        return callback;
    }
 
    public void setCallback(String callback) {
        this.callback = callback;
    }
 
    public String getCallback_func() {
        return callback_func;
    }
 
    public void setCallback_func(String callback_func) {
        this.callback_func = callback_func;
    }*/



	
	
	
	
	

	public MultipartFile getAttach() {
		return attach;
	}

	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}

	long recommend;
	Date regDate;
	String freePhotoA;
	

	MultipartFile attach;

	public long getFreeCode() {
		return freeCode;
	}

	public void setFreeCode(long freeCode) {
		this.freeCode = freeCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFreeTitle() {
		return freeTitle;
	}

	public void setFreeTitle(String freeTitle) {
		this.freeTitle = freeTitle;
	}

	public String getFreeContext() {
		return freeContext;
	}

	public void setFreeContext(String freeContext) {
		this.freeContext = freeContext;
	}

	public long getRef() {
		return ref;
	}

	public void setRef(long ref) {
		this.ref = ref;
	}

	public long getRecommend() {
		return recommend;
	}

	public void setRecommend(long recommend) {
		this.recommend = recommend;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getFreePhotoA() {
		return freePhotoA;
	}

	public void setFreePhotoA(String freePhotoA) {
		this.freePhotoA = freePhotoA;
	}

	

	

}
