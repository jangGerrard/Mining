package kr.ac.kw.mining.dao.impl.mapper;

import java.util.List;

import kr.ac.kw.mining.domain.Category;

public interface CategoryMapper {
	
	public void insertCategory(Category category);
	
	public List<Category> selectPagesLikeTitle(String like);
}
