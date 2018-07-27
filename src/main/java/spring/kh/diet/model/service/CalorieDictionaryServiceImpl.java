package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CalorieDictionaryDAO;
import spring.kh.diet.model.vo.FoodCalPageDataVO;
import spring.kh.diet.model.vo.FoodCalVO;

@Service("calorieDictionaryService")
public class CalorieDictionaryServiceImpl implements CalorieDictionaryService{
	
	@Resource(name="calorieDictionaryDAO")
	private CalorieDictionaryDAO calorieDictionary;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public FoodCalPageDataVO getFoodCalList(int currentPage) {
		int recordCountPerPage = 15;
		int naviCountPerPage = 5;
		
		FoodCalPageDataVO fcpd = new FoodCalPageDataVO();
		
		ArrayList<FoodCalVO> list = calorieDictionary.getFoodCalList(session, currentPage, recordCountPerPage);
		
		String pageNavi = calorieDictionary.getFoodCalPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);
		
		fcpd.setFcList(list);
		fcpd.setPageNavi(pageNavi);
		
		return fcpd;
	}

	@Override
	public FoodCalVO getFoodCalInfo(int fcIndex) {
		
		return calorieDictionary.getFoodCalInfo(session, fcIndex);
	}
}
