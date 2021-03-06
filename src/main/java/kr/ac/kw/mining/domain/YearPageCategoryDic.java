package kr.ac.kw.mining.domain;

public class YearPageCategoryDic {
	private int year;
	private int month;
	private int date;
	private int ypcCatId;
	private int ypcPageId;
	private String ypcCatTitle;
	private String ypcPageTitle;
	private ClType ypcClType;
	private int topCatId;
	private String derivedCategory;
	private String people;
	
	public YearPageCategoryDic() {
	}
	
	public YearPageCategoryDic(int year, int month, int date, int ypcCatId,
			int ypcPageId, String ypcCatTitle, String ypcPageTitle,
			ClType ypcClType,String derivedCategory) {
		super();
		this.year = year;
		this.month = month;
		this.date = date;
		this.ypcCatId = ypcCatId;
		this.ypcPageId = ypcPageId;
		this.ypcCatTitle = ypcCatTitle;
		this.ypcPageTitle = ypcPageTitle;
		this.ypcClType = ypcClType;
		this.derivedCategory = derivedCategory;
	}
	
	public YearPageCategoryDic(int year, int month, int date, int ypcCatId,
			int ypcPageId, String ypcCatTitle, String ypcPageTitle,
			ClType ypcClType, int topCatId,String derivedCategory) {
		this.year = year;
		this.month = month;
		this.date = date;
		this.ypcCatId = ypcCatId;
		this.ypcPageId = ypcPageId;
		this.ypcCatTitle = ypcCatTitle;
		this.ypcPageTitle = ypcPageTitle;
		this.ypcClType = ypcClType;
		this.topCatId = topCatId;
		this.derivedCategory = derivedCategory;
	}
	
	public void setAll(int year, int month, int date, int ypcCatId,
			int ypcPageId, String ypcCatTitle, String ypcPageTitle,
			ClType ypcClType, int topCatId,String derivedCategory){
		this.year = year;
		this.month = month;
		this.date = date;
		this.ypcCatId = ypcCatId;
		this.ypcPageId = ypcPageId;
		this.ypcCatTitle = ypcCatTitle;
		this.ypcPageTitle = ypcPageTitle;
		this.ypcClType = ypcClType;
		this.topCatId = topCatId;
		this.derivedCategory = derivedCategory;
	}
	
	public void SetByYPC(YearPageCategory ypc,String derivedCategory){
		this.year = ypc.getYear();
		this.month = ypc.getMonth();
		this.date = ypc.getDate();
		this.ypcCatId = ypc.getYpcCatId();
		this.ypcPageId = ypc.getYpcPageId();
		this.ypcCatTitle = ypc.getYpcCatTitle();
		this.ypcPageTitle = ypc.getYpcPageTitle();
		this.ypcClType = ypc.getYpcClType();
		this.topCatId = ypc.getTopCatId();
		this.derivedCategory = derivedCategory;
	}
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public int getYpcCatId() {
		return ypcCatId;
	}
	public void setYpcCatId(int ypcCatId) {
		this.ypcCatId = ypcCatId;
	}
	public int getYpcPageId() {
		return ypcPageId;
	}
	public void setYpcPageId(int ypcPageId) {
		this.ypcPageId = ypcPageId;
	}
	public String getYpcCatTitle() {
		return ypcCatTitle;
	}
	public void setYpcCatTitle(String ypcCatTitle) {
		this.ypcCatTitle = ypcCatTitle;
	}
	public String getYpcPageTitle() {
		return ypcPageTitle;
	}
	public void setYpcPageTitle(String ypcPageTitle) {
		this.ypcPageTitle = ypcPageTitle;
	}
	public ClType getYpcClType() {
		return ypcClType;
	}
	public void setYpcClType(ClType ypcClType) {
		this.ypcClType = ypcClType;
	}
	
	
	public int getTopCatId() {
		return topCatId;
	}

	public void setTopCatId(int topCatId) {
		this.topCatId = topCatId;
	}
	
	public String getDerivedCategory(){
		return derivedCategory;
	}
	
	public void setDerivedCategory(String derivedCategory){
		this.derivedCategory = derivedCategory;
	}
	
	public void setPeople(String people){
		this.people = people;
	}
	public String getPeople(){
		return this.people;
	}

	public String toString(){
		return "year : "+year + ", month : "+month+", date : "+date+" , catid : "+ypcCatId+"  , catTitle : "+ypcCatTitle+"  , pageId : "+ypcPageId+"  "
				+ ", pageTitle : "+ypcPageTitle+"  , clType : "+ypcClType+"  , topcatId : "+topCatId+" , derivedCate : "+derivedCategory;
	}
	
}
