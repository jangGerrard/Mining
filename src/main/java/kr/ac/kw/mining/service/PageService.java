package kr.ac.kw.mining.service;

import java.util.List;

import kr.ac.kw.mining.domain.CategoryLinks;
import kr.ac.kw.mining.domain.Page;
import kr.ac.kw.mining.domain.YearRelatedPageCategory;

public interface PageService {
	public Page findPage(int id);
	
	public List<YearRelatedPageCategory> findYearRelatedPages();
	
	public List<YearRelatedPageCategory> findYearRelatedPagesByCatId(int catId);
}
