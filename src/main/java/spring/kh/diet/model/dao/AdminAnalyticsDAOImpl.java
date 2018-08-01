package spring.kh.diet.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
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
	public int selectAnalytics(SqlSessionTemplate session,int timeType) {
		List<?> list = session.selectList("admin.selectAnalytics",timeType);
		int result=0;
		if(!list.isEmpty())
		{
			result=1;
		}
		//System.out.println(result);
		return result;
	}

	@Override
	public int updateAnalytics(SqlSessionTemplate session, TodayAnalyticsDetail tAD) {
		int result = session.update("admin.updateAnalytics",tAD);
		return result;
	}

	
}
