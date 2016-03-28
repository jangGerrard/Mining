package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.PageDao;
import kr.ac.kw.mining.dao.impl.mapper.PageMapper;
import kr.ac.kw.mining.domain.CategoryLinks;
import kr.ac.kw.mining.domain.Page;
import kr.ac.kw.mining.domain.YearRelatedPageCategory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PageDaoImpl implements PageDao{
	
	@Autowired
	private PageMapper pageMapper;
	
	@Override
	public Page selectPage(int id) {
		return pageMapper.selectPage(id);
	}
	
	public List<YearRelatedPageCategory> selectYearRelatedPages(){
		return pageMapper.selectYearRelatedPages();
	}
	
	public List<YearRelatedPageCategory> selectYearRelatedPagesByCatId(int catId){
		return pageMapper.selectYearRelatedPagesByCatId(catId);
	}

}
