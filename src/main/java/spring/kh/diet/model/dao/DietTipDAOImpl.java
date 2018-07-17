package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.DietTipPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;

@Repository("dietTipDAO")
public class DietTipDAOImpl implements DietTipDAO{

	@Override
	public ArrayList<DietTipVO> selectAllDietTip(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		DietTipPageDataVO dtpd = new DietTipPageDataVO();
		
		dtpd.setStart((currentPage-1)*recordCountPerPage+1);
		dtpd.setEnd(currentPage*recordCountPerPage);
		
		List<DietTipVO> list = session.selectList("dietTip.getList", dtpd);
		
		return (ArrayList<DietTipVO>)list;
	}

	@Override
	public String getDietTipPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
