package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import spring.kh.diet.model.vo.TodayAnalyticsDetail;

@Repository("adminAnalyticsDAO")
public class AdminAnalyticsDAOImpl implements AdminAnalyticsDAO{
	

	
	@Override
	public int insertAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD) {
		int result = session.insert("admin.insertAnalytics",tAD);
		return result;
	}

	@Override
	public ArrayList<TodayAnalyticsDetail> selectAnalytics(SqlSessionTemplate session,int timeType) {
		List<?> list = session.selectList("admin.selectAnalytics",timeType);
		return (ArrayList<TodayAnalyticsDetail>)list;
	}

	@Override
	public int updateAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD) {
		int result = session.update("admin.updateAnalytics",tAD);
		
		return result;
	}

	@Override
	public ArrayList<TodayAnalyticsDetail> selectAnalytics2(SqlSessionTemplate session,int num) {
		List<?> list = session.selectList("admin.selectAnalytics2",num);
		return (ArrayList<TodayAnalyticsDetail>)list;
	}

	
}
