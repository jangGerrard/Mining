package kr.ac.kw;

import java.util.List;

import kr.ac.kw.mining.dao.NodePersonDao;
import kr.ac.kw.mining.domain.NodePerson;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class NodePersonDaoTest {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml") ;		
		NodePersonDao nodePersonDao= ctx.getBean(NodePersonDao.class);
		
		List<NodePerson> nodePersons = nodePersonDao.selectNodePersons();
		
		for (NodePerson nodePerson : nodePersons) {
			System.out.println("nodeperson title : "+ nodePerson.getPersonPageTitle());
		}
	}
}
