package kr.ac.kw;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.YearPageCategory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

//selectRelatedPagesJoinCategorylinksById
public class SimpleTest {
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
	public static void main(String[] args){
		YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
		
		List<Integer> ids = new ArrayList<Integer>();
		//ids.add(5);ids.add(74067);
		List<YearPageCategory> ypcs = ypcDao.selectRelatedPagesJoinCategorylinksByIds(ids);
		
		for (YearPageCategory yearPageCategory : ypcs) {
			System.out.println(yearPageCategory.getYear() + " , "  +yearPageCategory.getYpcPageTitle());
		}
		
	}
}
