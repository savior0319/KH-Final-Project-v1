package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.HomeTrainingVO;

@Repository("homeTrainingDAO")
public class HomeTrainingDAOImpl implements HomeTrainingDAO{

	@Override
	public ArrayList<HomeTrainingVO> selectAllHomeTraining(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String homeTrainingPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HomeTrainingVO homeTraining(SqlSessionTemplate session, int indexNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
		

}
