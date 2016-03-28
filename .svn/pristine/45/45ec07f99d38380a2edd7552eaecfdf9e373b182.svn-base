package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.CategoryLinksDao;
import kr.ac.kw.mining.dao.impl.mapper.CategorylinksMapper;
import kr.ac.kw.mining.domain.CategoryLinks;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryLinksDaoImpl implements CategoryLinksDao{

	@Autowired
	private CategorylinksMapper categorylinksMapper;
	@Override
	public List<CategoryLinks> selectCategoryLinksFromId(int id) {
		return categorylinksMapper.selectCategoryLinksFromId(id);
	}

}
