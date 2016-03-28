package kr.ac.kw.mining.domain;

public class YearRelatedPageCategory {
	private int pageId;
	private int catId;
	private String pageTitle;
	private String catTitle;
	private ClType clType;
	
	
	public int getPageId() {
		return pageId;
	}
	public void setPageId(int pageId) {
		this.pageId = pageId;
	}
	public int getCatId(){
		return catId;
	}
	public void setCatId(int catId){
		this.catId = catId;
	}
	public String getPageTitle() {
		return pageTitle;
	}
	public void setPageTitle(String pageTitle) {
		this.pageTitle = pageTitle;
	}
	public String getCatTitle() {
		return catTitle;
	}
	public void setCatTitle(String catTitle) {
		this.catTitle = catTitle;
	}
	public ClType getClType() {
		return clType;
	}
	public void setClType(ClType clType) {
		this.clType = clType;
	}
}
