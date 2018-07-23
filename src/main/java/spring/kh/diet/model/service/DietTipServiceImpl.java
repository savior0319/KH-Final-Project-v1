package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.DietTipDAOImpl;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

@Service("dietTipService")
public class DietTipServiceImpl implements DietTipService {

	@Resource(name = "dietTipDAO")
	private DietTipDAOImpl dietTipDAO;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public DietTipPDVO getDietTipList(int currentPage, String type) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		DietTipPDVO dtpd = new DietTipPDVO();

		ArrayList<DietTipVO> list = dietTipDAO.selectAllDietTip(session, currentPage, recordCountPerPage, type);

		String pageNavi = dietTipDAO.getDietTipPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, type);

		dtpd.setDtList(list);
		dtpd.setPageNavi(pageNavi);

		return dtpd;
	}

	@Override
	public DietTipVO getDietTip(int indexNo) {
		
		DietTipVO dt = dietTipDAO.getDietTip(session, indexNo);
		
		return dt;
	}

	@Override
	public int registDietTip(DietTipVO dt) {
		return dietTipDAO.registDietTip(session, dt);
	}

}
