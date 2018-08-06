package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminAnalyticsDAO;
import spring.kh.diet.model.dao.AdminAnalyticsDAOImpl;
import spring.kh.diet.model.vo.SystemAnalyticsDetailTotalVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;

@Service("adminAnalyticsService")
public class AdminAnalyticServiceImpl implements AdminAnalyticService {

	@Resource(name="adminAnalyticsDAO")
	private AdminAnalyticsDAO adminDao;

	@Autowired
	private SqlSessionTemplate session;

	
	@Override
	public int insertAnalytics(TodayAnalyticsDetail tAD) {
		int result = adminDao.insertAnalytics(session,tAD);
		return result;
	}

	@Override
	public ArrayList<TodayAnalyticsDetail> selectAnalytics(int timeType) {
		ArrayList<TodayAnalyticsDetail> list = adminDao.selectAnalytics(session,timeType);
		return list;
	}


	@Override
	public int updateAnalytics(TodayAnalyticsDetail tAD) {
		int result = adminDao.updateAnalytics(session,tAD);
		return result;
	}

	@Override
	public ArrayList<TodayAnalyticsDetail> selectAnalytics2(int num) {
		ArrayList<TodayAnalyticsDetail> list = adminDao.selectAnalytics2(session,num);
		return list;
	}

}
