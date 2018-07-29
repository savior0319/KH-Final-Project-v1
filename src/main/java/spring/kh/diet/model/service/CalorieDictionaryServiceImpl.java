package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CalorieDictionaryDAO;
import spring.kh.diet.model.vo.FoodCalPageDataVO;
import spring.kh.diet.model.vo.FoodCalVO;
import spring.kh.diet.model.vo.HealthCalPageDataVO;
import spring.kh.diet.model.vo.HealthCalVO;

@Service("calorieDictionaryService")
public class CalorieDictionaryServiceImpl implements CalorieDictionaryService{
	
	@Resource(name="calorieDictionaryDAO")
	private CalorieDictionaryDAO calorieDictionaryDAO;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public FoodCalPageDataVO getFoodCalList(int currentPage, String searchText) {
		int recordCountPerPage = 15;
		int naviCountPerPage = 5;
		
		FoodCalPageDataVO fcpd = new FoodCalPageDataVO();
		
		ArrayList<FoodCalVO> list = calorieDictionaryDAO.getFoodCalList(session, currentPage, recordCountPerPage, searchText);
		
		String pageNavi = calorieDictionaryDAO.getFoodCalPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, searchText);
		
		fcpd.setFcList(list);
		fcpd.setPageNavi(pageNavi);
		
		return fcpd;
	}

	@Override
	public FoodCalVO getFoodCalInfo(int fcIndex) {
		
		return calorieDictionaryDAO.getFoodCalInfo(session, fcIndex);
	}

	@Override
	public HealthCalPageDataVO getHealthCalList(int currentPage, String searchText) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		
		HealthCalPageDataVO hcpd = new HealthCalPageDataVO();
		
		ArrayList<HealthCalVO> list = calorieDictionaryDAO.getHealthCalList(session, currentPage, recordCountPerPage, searchText);
		
		String pageNavi = calorieDictionaryDAO.getHealthCalPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, searchText);
		
		hcpd.setHcList(list);
		hcpd.setPageNavi(pageNavi);
		
		return hcpd;
	}

	@Override
	public HealthCalVO getHealthCalInfo(int hcIndex) {
		return calorieDictionaryDAO.getHealthCalInfo(session, hcIndex);
	}
}
