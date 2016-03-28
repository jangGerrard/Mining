package kr.ac.kw;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kr.ac.kw.mining.dao.PageDao;
import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.ClType;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.domain.YearRelatedPageCategory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class PageDaoTest {
	
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	static YearPageCategory ypc = new YearPageCategory();
	public static void main(String[] args) {
		PageDao pageDao = ctx.getBean(PageDao.class);

//		Page page = pageDao.selectPage(5);
//		System.out.println("page id : "+page.getPageId() + " page Title : "+ page.getPageTitle());
//		String title;
//		System.out.println("test 입니다.");
		System.out.println("start");
		try{
			BufferedWriter writer = new BufferedWriter(new FileWriter("c:\\Users\\Jang\\Desktop\\test.txt"));
			List<YearRelatedPageCategory>pageCates = pageDao.selectYearRelatedPages();
			
			for (int i = 0; i < pageCates.size(); i++) {
				
				findAndInsertInto(pageCates.get(i), pageDao, 0, pageCates.get(i).getCatId());///0 -> init depth .
				
				if(i % 1000 == 0){
					System.out.println(i +  " / "+pageCates.size());
				}
			}
			
			
//			pageCates = pageDao.selectYearRelatedPagesByCatId(1);
//			for (int i = 0; i < pageCates.size(); i++) {
//				System.out.println("page_title : "+pageCates.get(i).getPageTitle()+", cat_title : "+pageCates.get(i).getCatTitle()+", cl_type : "+pageCates.get(i).getClType());
//				
//			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("finish");
	}
	
	
	
	public static void findAndInsertInto(YearRelatedPageCategory yearRelPageCate, PageDao pageDao, int depth , int topCateId ){
		if(depth < 2 ){
			
			if(yearRelPageCate.getClType() == ClType.subcat){
				List<YearRelatedPageCategory> findList  = pageDao.selectYearRelatedPagesByCatId(yearRelPageCate.getCatId());
				for(int i = 0 ; i < findList.size(); i++){
					findAndInsertInto(findList.get(i), pageDao, depth+1, topCateId);
				}
			} else if(yearRelPageCate.getClType() == ClType.page){
				///insert하면 된다.
				///여기를 해야한다.
				////여기를 해서 insertINSERTINSERTINSERTINSERTINSERTINSERT
				Pattern pattern = Pattern.compile("[0-9]*년");
				Matcher matcher = pattern.matcher(yearRelPageCate.getCatTitle());
				while(matcher.find()){
//					System.out.println(matcher.group() );///group이 년도.
					
					//////////////////////////////////////insert.../////////
					if(!(matcher.group().equals(""))){
						
						ypc.setAll(Integer.parseInt(matcher.group().replaceAll("년", "")), 0, 0, yearRelPageCate.getCatId(), 
								yearRelPageCate.getPageId(), yearRelPageCate.getCatTitle(), yearRelPageCate.getPageTitle(), yearRelPageCate.getClType(), topCateId);
						YearPageCategoryDao dao = ctx.getBean(YearPageCategoryDao.class);
						System.out.println(ypc.toString());
						if(dao.selectYearPageCategory(ypc).size() == 0){
							System.out.println("year"+ypc.getYear());
//							dao.insertYearPageCategory(ypc);
						}
						
					}
					/////////////////////////////////////////////////////////////
					
					if(yearRelPageCate.getPageTitle().equals(yearRelPageCate.getCatTitle())){
						
					}
					
					
				}
			}
		}
	}
	
}
