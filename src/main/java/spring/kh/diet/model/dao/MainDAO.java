package spring.kh.diet.model.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.HealthCenterVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.UpdateSSVO;

public interface MainDAO {

	ArrayList<HealthCenterVO> selectAllHealthCenter(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, String location);

	String getHealthCenterPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String location);

	int insertSessionToList(SqlSessionTemplate session, HttpSession session2, HttpServletRequest request);

	ArrayList<OnSessionVO> selectAllSesssionList(SqlSessionTemplate session);

	int updateOnsession(SqlSessionTemplate session, UpdateSSVO uSSVO);

	int updateAlreadyOnsession(SqlSessionTemplate session, UpdateSSVO uSSVO);
	
}
