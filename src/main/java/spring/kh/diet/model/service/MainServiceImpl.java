package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.MainDAO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.HealthCenterPDVO;
import spring.kh.diet.model.vo.HealthCenterVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.UpdateSSVO;

@Service("mainService")
public class MainServiceImpl implements MainService {

	@Autowired
	private SqlSessionTemplate session;

	@Resource(name = "mainDAO")
	private MainDAO mDao;

	public MainServiceImpl() {
	}

	@Override
	public HealthCenterPDVO getHealthCenterList(int currentPage, String location) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		HealthCenterPDVO hVo = new HealthCenterPDVO();

		ArrayList<HealthCenterVO> list = mDao.selectAllHealthCenter(session, currentPage, recordCountPerPage, location);

		String pageNavi = mDao.getHealthCenterPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage,
				location);

		hVo.setHcList(list);
		hVo.setPageNavi(pageNavi);

		return hVo;
	}

	@Override
	public int insertSessionToList(HttpSession session2, HttpServletRequest request) {
		int result = 0;
		result = mDao.insertSessionToList(session, session2, request);

		return result;
	}

	@Override
	public ArrayList<OnSessionVO> selectAllSessionList() {

		ArrayList<OnSessionVO> list = mDao.selectAllSesssionList(session);
		return list;
	}

	@Override
	public void updateOnsession(UpdateSSVO uSSVO) {
		mDao.updateOnsession(session, uSSVO);
		
	}

	@Override
	public int updateAlreadyOnsession(UpdateSSVO uSSVO) {
		int result = mDao.updateAlreadyOnsession(session,uSSVO);
		return result;
	}
	

	@Override
	public ArrayList<AllSessionVO> selectAllSessionList2() {

		ArrayList<AllSessionVO> list = mDao.selectAllSesssionList2(session);
		return list;
	}


	@Override
	public int autoDeleteSession(AllSessionVO allSessionVO) {
		int result = mDao.autoDeleteSession(session,allSessionVO);
		return result;
	}

	@Override
	public int autoTransSession(AllSessionVO allSessionVO) {
		int result = mDao.autoTransSession(session,allSessionVO);
		return result;
	}

}
