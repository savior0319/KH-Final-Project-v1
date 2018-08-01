package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.TodayAnalyticsDetail;

public interface AdminAnalyticService {

	int insertAnalytics(TodayAnalyticsDetail tAD);

	int selectAnalytics(int timeType);

}
