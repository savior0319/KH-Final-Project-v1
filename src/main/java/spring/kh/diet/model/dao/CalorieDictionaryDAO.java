package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.FoodCalVO;

public interface CalorieDictionaryDAO {
	String getFoodCalPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	FoodCalVO getFoodCalInfo(SqlSessionTemplate session, int fcIndex);

	ArrayList<FoodCalVO> getFoodCalList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

}
