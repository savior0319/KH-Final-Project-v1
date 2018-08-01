package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.TodayAnalyticsDetail;

public interface AdminAnalyticsDAO {

	int insertAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD);

	int selectAnalytics(SqlSessionTemplate session, int timeType);

	int updateAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD);

}
