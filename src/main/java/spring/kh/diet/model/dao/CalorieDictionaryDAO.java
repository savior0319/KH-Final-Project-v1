package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.FoodCalVO;
import spring.kh.diet.model.vo.HealthCalVO;

public interface CalorieDictionaryDAO {
	String getFoodCalPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String searchText);

	FoodCalVO getFoodCalInfo(SqlSessionTemplate session, int fcIndex);

	ArrayList<FoodCalVO> getFoodCalList(SqlSessionTemplate session, int currentPage, int recordCountPerPage, String searchText);

	ArrayList<HealthCalVO> getHealthCalList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getHealthCalPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	HealthCalVO getHealthCalInfo(SqlSessionTemplate session, int hcIndex);

}
