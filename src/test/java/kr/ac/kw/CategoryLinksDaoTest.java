package kr.ac.kw;

import java.util.List;

import kr.ac.kw.mining.dao.CategoryLinksDao;
import kr.ac.kw.mining.domain.CategoryLinks;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CategoryLinksDaoTest {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
//		CategoryLinksDao cateDao= ctx.getBean(CategoryLinksDao.class);
//		List<CategoryLinks> cates = cateDao.selectCategoryLinksFromId(5);
//		
//		for (CategoryLinks categoryLinks : cates) {
//			System.out.println("cl To : "+categoryLinks.getClTo());
//		}
		
		
		
		
		
		System.out.println("test 입니다.");
	
	}
}
