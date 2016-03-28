package kr.ac.kw;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kw.mining.dao.PageLinksDao;
import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.PageLink;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.singleton.JsonWriterSingleton;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/*
 * reference : http://www.mkyong.com/java/jackson-streaming-api-to-read-and-write-json/
 * */
public class MakeJsonString {
	static List<PageIdTitle> containedPageId = new ArrayList<PageIdTitle>();
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	static YearPageCategory ypc = new YearPageCategory();
	static PageIdTitle pageTitle;
	static String yearBirth = "년_태어남";
	static final int MAX_YEAR = 2000;
	static JsonWriterSingleton jsonWriterSingleton ; 
	public static final int WIDTH = 100;
	public static final int HEIGHT = 100;
	
	
	public static void main(String[] args){
		int firstNodeId=0;
//		makeJsonString = new MakeJsonString();
		YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
		PageLinksDao pageLinksDao = ctx.getBean(PageLinksDao.class);
		
		jsonWriterSingleton = JsonWriterSingleton.getInstance();
		jsonWriterSingleton.makeJsonStrBeforeWriteNode();
		jsonWriterSingleton.startEdges();
//		for(int i = 0 ; i < MAX_YEAR ; i++){
		for(int i = 1000 ; i < 1100 ; i++){	 //년도별 ..
			List<YearPageCategory> yearpagecategorys = ypcDao.selectPeopleByBirthYear(i+yearBirth);
			if(yearpagecategorys.size() > 0){
				System.out.println("size !0");
				for(int j = 0 ; j < yearpagecategorys.size(); j++){ //페이지 하나별로
					YearPageCategory ypc = yearpagecategorys.get(j);
					System.out.println("year : "+ypc.getYear() + " pageId : "+ypc.getYpcPageId() + " pageTitle : "+ ypc.getYpcPageTitle());
					jsonWriterSingleton.makeNodeJsonString(ypc.getYpcPageId() , ypc.getYpcPageTitle() , "인물" , ypc.getYear(), (ypc.getYear() - 1000)* WIDTH, j * HEIGHT );

//					for(int k = 0; k < lastYearPageId.size(); k++){
//						jsonWriterSingleton.makeEdgeJsonString("e"+ypc.getYear()+j+k , lastYearPageId.get(k).toString() , ypc.getYpcPageId()+"");
//						
//					}
					
					containedPageId.add(new PageIdTitle(ypc.getYpcPageTitle(), ypc.getYpcPageId()));
					firstNodeId = j;
					
				}
			}
			
//			//lastYearPageId  = currentYearPageId;
//			lastYearPageId.clear();
//			for (Integer integer : currentYearPageId) {
//				lastYearPageId.add(integer);
//			}
//			currentYearPageId.clear();
			
			
			
			
		}
		
		//여기서 부터 들어있는 페이지 하나씩 검색해서,
		//검색한 결과중에 있으면 그것을 edge로 연결한다.
		
		for(int i  = 0 ; i < containedPageId.size() ; i++){
			List<PageLink> pageLinks  = pageLinksDao.selectPageLinkById(containedPageId.get(i).getId());
			
			for (PageLink pageLink : pageLinks) {
				for(int j = 0 ; j < containedPageId.size(); j++){
					if(pageLink.getPlTitle().trim().equals(containedPageId.get(j).getTitle().trim())){
						jsonWriterSingleton.makeEdgeJsonString("e"+containedPageId.get(i).getId()+containedPageId.get(j).getId() ,containedPageId.get(i).getId()+"" , containedPageId.get(j).getId()+"");
					}
				}
			}
		}
		
		
//		jsonWriterSingleton.makeBeforeWriteEdges();
//		jsonWriterSingleton.makeEdgeJsonString(1111	,12314, 21341234);
		jsonWriterSingleton.endEdges();
		jsonWriterSingleton.endRemainJsonString();
//		makeJsonString.json();
		System.out.println("finished");
		
	}
	

}

class PageIdTitle{
	private String title;
	private int id;
	
	
	public PageIdTitle(String title, int id) {
		super();
		this.title = title;
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
}
