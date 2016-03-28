package kr.ac.kw.mining.dao.impl.mapper;

import java.util.List;

import kr.ac.kw.mining.domain.CategoryLinks;
import kr.ac.kw.mining.domain.Page;
import kr.ac.kw.mining.domain.YearRelatedPageCategory;

public interface PageMapper {
	public Page selectPage(int id);
	
	public List<YearRelatedPageCategory> selectYearRelatedPages();
	
	public List<YearRelatedPageCategory> selectYearRelatedPagesByCatId(int catId);
}
