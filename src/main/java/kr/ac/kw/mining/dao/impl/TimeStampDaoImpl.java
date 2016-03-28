package kr.ac.kw.mining.dao.impl;

import java.util.List;

import kr.ac.kw.mining.dao.TimeStampDao;
import kr.ac.kw.mining.dao.impl.mapper.TimeStampMapper;
import kr.ac.kw.mining.domain.TimeStamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimeStampDaoImpl implements TimeStampDao{

	@Autowired
	private TimeStampMapper timeStampMapper;
	
	@Override
	public List<TimeStamp> selectTimeStamps() {
		return timeStampMapper.selectTimeStamps();
	}
	
	public List<TimeStamp> selectTimeStampsByBetweenCenterYear(int year){
		return timeStampMapper.selectTimeStampsByBetweenCenterYear(year);
	}

}
