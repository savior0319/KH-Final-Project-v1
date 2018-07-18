package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.DietTipDAOImpl;
import spring.kh.diet.model.vo.DietTipPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;

@Service("dietTipService")
public class DietTipServiceImpl implements DietTipService {

	@Resource(name = "dietTipDAO")
	private DietTipDAOImpl dietTipDAO;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public DietTipPageDataVO getDietTipList(int currentPage) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		DietTipPageDataVO dtpd = new DietTipPageDataVO();

		ArrayList<DietTipVO> list = dietTipDAO.selectAllDietTip(session, currentPage, recordCountPerPage);

		String pageNavi = dietTipDAO.getDietTipPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		dtpd.setDtList(list);
		dtpd.setPageNavi(pageNavi);

		return dtpd;
	}

}
