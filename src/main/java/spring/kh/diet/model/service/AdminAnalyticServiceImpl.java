package spring.kh.diet.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminAnalyticsDAO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;

@Service("adminAnalytics")
public class AdminAnalyticServiceImpl implements AdminAnalyticService {


	
	@Resource(name = "adminAnalyticsDAO")
	private AdminAnalyticsDAO aDao;

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertAnalytics(TodayAnalyticsDetail tAD) {
		int result = aDao.insertAnalytics(session,tAD);
		return result;
	}

	@Override
	public int selectAnalytics(int timeType) {
		System.out.println("@");
		int result = aDao.selectAnalytics(session,timeType);
		System.out.println(result+10);
		return result;
	}

}
