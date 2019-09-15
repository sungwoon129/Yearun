package kr.ac.kopo.polycms.util;

public class Pager {
	float total;
	int page = 1;
	int perPage = 20;
	int vTotal;
	int todayTotal;
	int blockScale=5;
	
	int totBlock;
	
	int blockEnd;
	
	
	
	String search;
	String keyword;
	int perPageOption = 20;
	
	
	
	
	


	


	

	public int getPerPageOption() {
		return perPageOption;
	}


	public void setPerPageOption(int perPageOption) {
		this.perPageOption = perPageOption;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public int getTotBlock() {
		return totBlock;
	}


	public void setTotBlock(int total) {
		int maxPage = (int) Math.ceil(total / perPageOption);
		
		totBlock=(int)Math.ceil(maxPage/blockScale);
	}


	public void setBlockRange() {
		
	
	}


	public void setvTotal(int vTotal) {
		this.vTotal = vTotal;
	}


	public int getTodayTotal() {
		return todayTotal;
	}


	public void setTodayTotal(int todayTotal) {
		this.todayTotal = todayTotal;
	}


	public int getvTotal() {
		return (int)total;
	}


	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getStart() {
		return (page-1)* perPageOption; // start라는 필드가 존재하지 않아도 mybatis는 pager.start라구 하면 겟스타트하면 가져올 수 있겠구나?! 라고 생각함
	}
	
	public String getPagination() {
		String html = "";
		int maxPage = (int) Math.ceil(total / perPageOption);
		int curBlock=(int)Math.ceil((page-1)/blockScale)+1;
		int blockBegin=(curBlock-1) * blockScale+1;
		int blockEnd = blockBegin + blockScale - 1;
		if(blockEnd > maxPage) blockEnd = maxPage;
		int excess = blockEnd + 1;
		int under = blockBegin -1;
		
		
		html += "<div class=\"pager\">";
		
		if(page != 1) {
			html += "<span class=\"";
			html += "start";
			html +="\"><a href=\"?page=1";
			if(perPageOption != 20) {
				html += "&perPageOption=" + perPageOption;
			
			}
			if(search != null&& keyword != null) {
				html +="&perPageOption=" + perPageOption +"&search=" + search + "&keyword=" + keyword;
				}
		    html +="\">&#60;&nbsp; 처음</a></span>";
		    
		}
		
		if(under < 1) {
		under=1;
		}
		else if((blockBegin -1) >= 1)
			under = blockBegin -1;
		if(curBlock != 1) {
		html += "<span class=\"";
		html += "previous";
		html +="\"><a href=\"?page=" +  under ; 
		if(perPageOption != 20) {
			html += "&perPageOption=" + perPageOption;
		
		}
		if(search != null&& keyword != null) {
			html +="&perPageOption=" + perPageOption +"&search=" + search + "&keyword=" + keyword;
			}
		html +=	"\">&#60;&nbsp; 이전</a></span>";
		}
		
		for(int i=blockBegin; i<=blockEnd; i++) {
			//<span><a href="?page=1">1</a></span>
			
			
				html += "&nbsp;<a href=\"?page=" + i;
				if(perPageOption != 20) {
					html += "&perPageOption=" + perPageOption;
					
				}
				if(search != null&& keyword != null) {
				html +="&perPageOption=" + perPageOption +"&search=" + search + "&keyword=" + keyword;
				}
				html += "\"><span class=\"";
				if(page == i)
					html += " active ";
				else
					html += "normal";
				html +="\"><p>"+i+"</p></span></a>&nbsp";
		};
			/*html += "<span class=\"";
			
			if(page == i)
				html += " active ";
			else
				html += "normal";
			
			html += "\"><a href=\"?page=" + i; // "안에 "표시하려면 \ 사용
			if(search != null&& keyword != null) {
				html +="&search=" + search + "&keyword=" + keyword;
			}
			html +=  "\">"+i;
			html += "</a></span>&nbsp";
		}*/
		if(excess >= maxPage) {  
			excess = maxPage;
		}
			else if((blockEnd + 1) < maxPage) {
				excess = blockEnd + 1 ;
			}
		
			
		if(page < maxPage) {
			html += "<span class=\"";
			html += "next";
			html +="\"><a href=\"?page=" +  excess ; 
			if(perPageOption != 20) {
				html += "&perPageOption=" + perPageOption;
			
			}
			if(search != null&& keyword != null) {
				html +="&perPageOption=" + perPageOption +"&search=" + search + "&keyword=" + keyword;
				}
			html +=	"\">다음&nbsp;&#62;</a></span>";
		}
		if(page < maxPage) {
			html += "<span class=\"";
			html += "end";
			html +="\"><a href=\"?page=" +  maxPage;
			if(perPageOption != 20) {
				html += "&perPageOption=" + perPageOption;
			
			}
			if(search != null&& keyword != null) {
				html +="&perPageOption=" + perPageOption +"&search=" + search + "&keyword=" + keyword;
				}
			html +="\">끝 &nbsp;&#62;</a></span>";
		}
		html += "</div>";
		return html;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	
}
