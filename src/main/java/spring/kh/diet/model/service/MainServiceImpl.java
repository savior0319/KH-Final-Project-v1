package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.MainDAO;
import spring.kh.diet.model.vo.HealthCenterPageDataVO;
import spring.kh.diet.model.vo.HealthCenterVO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private SqlSessionTemplate session;

	@Resource(name = "mainDAO")
	private MainDAO mDao;

	public MainServiceImpl() {
	}

	@Override
	public HealthCenterPageDataVO getHealthCenterList(int currentPage) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		HealthCenterPageDataVO hVo = new HealthCenterPageDataVO();

		ArrayList<HealthCenterVO> list = mDao.selectAllHealthCenter(session, currentPage, recordCountPerPage);

		String pageNavi = mDao.getHealthCenterPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		hVo.setHcList(list);
		hVo.setPageNavi(pageNavi);

		return hVo;
	}

}
