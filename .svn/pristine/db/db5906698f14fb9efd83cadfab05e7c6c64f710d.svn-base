package kr.ac.kw;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kr.ac.kw.mining.dao.CategoryLinksDao;
import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.CategoryLinks;
import kr.ac.kw.mining.domain.YearPageCategory;
import kr.ac.kw.mining.domain.YearPageCategoryDic;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class YearPageCateDaoTest {
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	static YearPageCategory ypc = new YearPageCategory();
	public static void updateBCYear(String[] args){
		YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
		List<YearPageCategory> yearPageCategorys = ypcDao.selectBCYear();
		
		System.out.println("size : "+yearPageCategorys.size());
//		다 찾음
		
		for(int i = 0 ; i < yearPageCategorys.size() ; i++){
			ypc = yearPageCategorys.get(i);
			System.out.println("ypc  year : "+ypc.getYear() + "ypc pageId : "+ypc.getYpcPageId());
			ypcDao.updateBCYear(ypc);
			
			if(i % 100 == 0){
				System.out.println(i +" / "+ yearPageCategorys.size());
			}
		}
		System.out.println("find");
	}
	static List<String> korHisDicList = new ArrayList<String>();
	static boolean findRelatedCategory = false;
	public static void main(String[] args){
		
		YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
		CategoryLinksDao cateLinkDao = ctx.getBean(CategoryLinksDao.class);
//		List<YearPageCategory> yearPageCategorys = ypcDao.selectYearPageCategorys();
//		YearPageCategory yearPageCategory;
//		System.out.println("size() : "+yearPageCategorys.size());
//		
//		//여기서 부터.
//		
//		for(int i = 0 ; i < yearPageCategorys.size() ; i++){
//			yearPageCategory = yearPageCategorys.get(i);
//			//이놈의 pageId를 이용해서 카테고리들 확인한다. 
//		}
		
		
		
		
		
		
		
		List<Integer> ypcPageIds = ypcDao.selectYpcPageIds();
//		Pattern pattern = Pattern.compile("[0-9]*년");
//		Matcher matcher = pattern.matcher(yearRelPageCate.getCatTitle());
		Pattern pattern;
		Matcher matcher;
		YearPageCategoryDic yearPageCategoryDic = new YearPageCategoryDic(); 
		listInit();
		System.out.println("start");
		
		
		
		for(int i = 0 ; i < ypcPageIds.size() ; i++){
			if(i % 100 == 0){
				System.out.println(i+" / "+ypcPageIds.size());
			}
			Integer ypcPageId = ypcPageIds.get(i);
			findRelatedCategory = false;
//			System.out.println("ypcPageId : "+ypcPageId);
			//여기서 그 것만큼의 카테고리 찾고,
			List<CategoryLinks> categoryLinks =  cateLinkDao.selectCategoryLinksFromId(ypcPageId);
			//아래 맵과 연관된거 찾아서 그다음에 정규식 만들어서. 하는거야
			for(int j = 0 ; j < korHisDicList.size(); j++){
				String korHisDic = korHisDicList.get(j);
				pattern = Pattern.compile(".*"+korHisDic+ ".*");
				
				for(int k = 0; k < categoryLinks.size(); k++){//ypc의 카테고리 중에서 사전과 패턴 일치하는 것 찾기.
					String clTo = categoryLinks.get(k).getClTo();
					matcher = pattern.matcher(clTo);
					if(matcher.find()){
						//찾은 거야 국가 그거 카테고리를
						String findedCategory = matcher.group();
//						System.out.println("matcher find : "+findedCategory); //k브레이크, j브레이크, 플래그 세팅해서 브레이크 걸게 해야겟다.
						
						//ypcPageId; 이거를 이용해서 찾아서
						
						List<YearPageCategory> findedYpcs = ypcDao.selectYearPageCategorysByPageId(ypcPageId);
						for (YearPageCategory yearPageCategory : findedYpcs) {
//							System.out.println("toStr : "+yearPageCategory.toString());
							yearPageCategoryDic.SetByYPC(yearPageCategory, findedCategory);
							ypcDao.insertYearPageCategoryDic(yearPageCategoryDic);
						}						
						findRelatedCategory = true;
						break;
					}
				}
				if(findRelatedCategory){
					break;
				}
			}

			//ypc 그 아이디로 연관된거 다 찾아서 리스트로 받아와서
			
			//그것을 새 테이블에 쓴다.
			
		}
		System.out.println("fin");
		
	}
	public static void listInit(){
		
		korHisDicList.add("고조선");
		korHisDicList.add("부여");
		korHisDicList.add("옥저");
		korHisDicList.add("동예");
		korHisDicList.add("가야");
		korHisDicList.add("고구려");
		korHisDicList.add("신라");
		korHisDicList.add("백제");
		korHisDicList.add("발해");
		korHisDicList.add("후백제");
		korHisDicList.add("태봉");
		korHisDicList.add("고려");
		korHisDicList.add("조선");
		korHisDicList.add("대한제국");
		korHisDicList.add("한국");
		korHisDicList.add("대한민국");
		korHisDicList.add("삼한");
		korHisDicList.add("마한");
		korHisDicList.add("진한");
		korHisDicList.add("변한");
		korHisDicList.add("후고구려");
		korHisDicList.add("일제_강점기");
	}
}