package kr.ac.kw;

import java.util.List;

import kr.ac.kw.mining.dao.YearPageCategoryDao;
import kr.ac.kw.mining.domain.YearPageCategory;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SiftDownPeoples {
	
	static ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;
	static YearPageCategoryDao ypcDao = ctx.getBean(YearPageCategoryDao.class);
	
	public static void main(String[] args) {
		List<YearPageCategory> ypcs = ypcDao.selectBornAndDeadList();
		
		for(int i = 0 ; i < ypcs.size() ; i ++){
			Integer id = ypcs.get(i).getYpcPageId();
			ypcDao.updatePerson(id);
			
			if(i % 1000 == 0){
				System.out.println(i+" / "+ypcs.size());
			}
		}
	}
}
