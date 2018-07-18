package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.HealthCenterVO;

public interface MainDAO {

	ArrayList<HealthCenterVO> selectAllHealthCenter(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage);

	String getHealthCenterPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

}
