package kr.ac.kw.mining.service.impl;

import java.util.List;

import kr.ac.kw.mining.dao.PageDao;
import kr.ac.kw.mining.domain.CategoryLinks;
import kr.ac.kw.mining.domain.Page;
import kr.ac.kw.mining.domain.YearRelatedPageCategory;
import kr.ac.kw.mining.service.PageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PageServiceImpl implements PageService{
	
	@Autowired
	private PageDao pageDao;
	
	
	@Override
	public Page findPage(int id) {
		return pageDao.selectPage(id);
	}
	
	public List<YearRelatedPageCategory> findYearRelatedPages(){
		return pageDao.selectYearRelatedPages();
	}
	
	public List<YearRelatedPageCategory> findYearRelatedPagesByCatId(int catId){
		return pageDao.selectYearRelatedPagesByCatId(catId);
	}
	
}
