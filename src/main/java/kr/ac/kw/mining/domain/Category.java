package kr.ac.kw.mining.domain;

public class Category {
	private int catId;
	private String catTitle;
	private int catPages;
	private int catSubcats;
	private int catFiles;
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatTitle() {
		return catTitle;
	}
	public void setCatTitle(String catTitle) {
		this.catTitle = catTitle;
	}
	public int getCatPages() {
		return catPages;
	}
	public void setCatPages(int catPages) {
		this.catPages = catPages;
	}
	public int getCatSubcats() {
		return catSubcats;
	}
	public void setCatSubcats(int catSubcats) {
		this.catSubcats = catSubcats;
	}
	public int getCatFiles() {
		return catFiles;
	}
	public void setCatFiles(int catFiles) {
		this.catFiles = catFiles;
	}
}
