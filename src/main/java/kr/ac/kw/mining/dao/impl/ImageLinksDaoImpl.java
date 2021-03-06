package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.ImageLinksDao;
import kr.ac.kw.mining.dao.impl.mapper.ImageLinksMapper;
import kr.ac.kw.mining.domain.ImageLinks;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ImageLinksDaoImpl implements ImageLinksDao{

	@Autowired
	private ImageLinksMapper imageLinksMapper;
	
	
	public void insertImageLinks(ImageLinks imageLinks){
		imageLinksMapper.insertImageLinks(imageLinks);
	}
	
	@Override
	public List<ImageLinks> selectImageLinksById(int ilFrom) {
		return imageLinksMapper.selectImageLinksById(ilFrom);
	}
	
	public List<ImageLinks> selectIlToOrderByIlTo(){
		return imageLinksMapper.selectIlToOrderByIlTo();
	}

}
