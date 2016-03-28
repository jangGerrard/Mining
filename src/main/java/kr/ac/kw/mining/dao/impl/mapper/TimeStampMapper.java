package kr.ac.kw.mining.dao.impl.mapper;

import java.util.List;

import kr.ac.kw.mining.domain.TimeStamp;

public interface TimeStampMapper {
	public List<TimeStamp> selectTimeStamps();
	
	public List<TimeStamp> selectTimeStampsByBetweenCenterYear(int year);
}
