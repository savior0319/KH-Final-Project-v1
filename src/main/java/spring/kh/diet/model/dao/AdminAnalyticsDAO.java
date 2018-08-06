package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.TodayAnalyticsDetail;

public interface AdminAnalyticsDAO {

	int insertAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD);

	ArrayList<TodayAnalyticsDetail> selectAnalytics(SqlSessionTemplate session, int timeType);

	int updateAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD);

	ArrayList<TodayAnalyticsDetail> selectAnalytics2(SqlSessionTemplate session, int num);

}
