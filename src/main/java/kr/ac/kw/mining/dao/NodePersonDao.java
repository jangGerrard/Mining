package kr.ac.kw.mining.dao;

import java.util.List;

import kr.ac.kw.mining.domain.NodePerson;

public interface NodePersonDao {
	public List<NodePerson> selectNodePersons();
}
