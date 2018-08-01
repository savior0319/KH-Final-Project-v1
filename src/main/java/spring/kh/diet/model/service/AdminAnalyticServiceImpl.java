package spring.kh.diet.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminAnalyticsDAO;
import spring.kh.diet.model.dao.AdminAnalyticsDAOImpl;
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
	public int selectAnalytics(int timeType) {
		int result = adminDao.selectAnalytics(session,timeType);
		return result;
	}


	@Override
	public int updateAnalytics(TodayAnalyticsDetail tAD) {
		int result = adminDao.updateAnalytics(session,tAD);
		return result;
	}

}
