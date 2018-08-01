package spring.kh.diet.common;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import spring.kh.diet.model.service.AdminAnalyticService;
import spring.kh.diet.model.service.AdminService;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;
@SuppressWarnings("all")
@Controller
public class SystemAnalyticsInsert {

	@Resource(name="adminAnalytics")
	private AdminAnalyticService as;
		
	public int insertAnalytics(TodayAnalyticsDetail tAD) {

		int result = as.insertAnalytics(tAD);
		
		return result;
	}
	
	public int updateAnalytics() {
		
		return 0;
	}
	public int selectAnalytics(int timeType) {
		System.out.println("###");
		int result = as.selectAnalytics(timeType);
		return result;
	}
}
