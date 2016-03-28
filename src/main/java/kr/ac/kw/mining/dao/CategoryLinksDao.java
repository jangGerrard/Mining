package kr.ac.kw.mining.dao;

import java.util.List;

import kr.ac.kw.mining.domain.CategoryLinks;

public interface CategoryLinksDao {
	public List<CategoryLinks> selectCategoryLinksFromId(int id);
}
