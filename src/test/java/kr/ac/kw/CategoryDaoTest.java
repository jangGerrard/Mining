package kr.ac.kw;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import kr.ac.kw.mining.dao.CategoryDao;
import kr.ac.kw.mining.domain.Category;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CategoryDaoTest {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
		CategoryDao cateDao= ctx.getBean(CategoryDao.class);
		String temp = "년";
		List<Category> cates = cateDao.selectPagesLikeTitle("년");
		System.out.println("cate size() : "+cates.size());
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter("c:\\Users\\Jang\\Desktop\\test.txt"));
			
			for (int i = 0; i < cates.size() ; i++) {
				String toWrite = "catId : "+cates.get(i).getCatId()+" ,title : "+cates.get(i).getCatTitle();
//				writer.write(toWrite);
//				writer.newLine();
//				if(i % 100 == 0){
//					System.out.println(i);
//				}
				
				
				///여기에 한개씩 열어보자
				Category category = cates.get(i);
				
			}
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		for (int i = 0; i < 100; i++) {
//			String toWrite = "catId : "+cates.get(i).getCatId()+" ,title : "+cates.get(i).getCatTitle();
//			System.out.println(toWrite);
//		}
		
		System.out.println("finish");

//		Category category = new Category();
//		category.setCatId(8888888);
//		category.setCatTitle("년");
//		cateDao.insertCategory(category);
		
		
	}
}
