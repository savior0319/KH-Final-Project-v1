package spring.kh.diet.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.HomeTrainingVO;

public interface HomeTrainingDAO {
	
	ArrayList<HomeTrainingVO> selectAllHomeTraining(SqlSessionTemplate session,int currentPage, int recordCountPerPage,String type);

	String homeTrainingPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage,String type);

	HomeTrainingVO homeTraining(SqlSessionTemplate session, int indexNo);

	ArrayList<HomeTrainingVO> pnWriteList(SqlSessionTemplate session, int indexNo);
}
