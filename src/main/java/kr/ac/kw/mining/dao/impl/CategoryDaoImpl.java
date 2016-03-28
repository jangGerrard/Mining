package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.CategoryDao;
import kr.ac.kw.mining.dao.impl.mapper.CategoryMapper;
import kr.ac.kw.mining.domain.Category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Autowired
	private CategoryMapper categoryMapper;
	
	public void insertCategory(Category category){
		this.categoryMapper.insertCategory(category);
	}
	
	@Override
	public List<Category> selectPagesLikeTitle(String like) {
		return categoryMapper.selectPagesLikeTitle(like);
	}

}
