package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.NodePersonDao;
import kr.ac.kw.mining.dao.impl.mapper.NodePersonMapper;
import kr.ac.kw.mining.domain.NodePerson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NodePersonDaoImpl implements NodePersonDao {

	@Autowired
	private NodePersonMapper nodePersonMapper;
	
	@Override
	public List<NodePerson> selectNodePersons() {
		return nodePersonMapper.selectNodePersons();
	}

}
