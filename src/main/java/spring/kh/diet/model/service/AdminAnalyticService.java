package spring.kh.diet.model.service;

import java.util.ArrayList;

import spring.kh.diet.model.vo.SystemAnalyticsDetailTotalVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;

public interface AdminAnalyticService {

	int insertAnalytics(TodayAnalyticsDetail tAD);

	ArrayList<TodayAnalyticsDetail> selectAnalytics(int timeType);

	int updateAnalytics(TodayAnalyticsDetail tAD);

	ArrayList<TodayAnalyticsDetail> selectAnalytics2(int timeType);

}
