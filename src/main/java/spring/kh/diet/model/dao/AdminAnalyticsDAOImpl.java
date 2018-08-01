package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.TodayAnalyticsDetail;

@SuppressWarnings("all")
@Repository(value = "adminAnalyticsDAO")
public class AdminAnalyticsDAOImpl implements AdminAnalyticsDAO{
	@Override
	public int insertAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD) {
		int result = session.insert("admin.insertAnalytics",tAD);
		return result;
	}

	@Override
	public int selectAnalytics(SqlSessionTemplate session,int timeType) {
		System.out.println("1");
		List<?> list = session.selectList("admin.selectAnalytics",timeType);
		System.out.println(list.toString());
		int result=0;
		if(!list.isEmpty())
		{
			result=1;
		}
		return result;
	}
}
