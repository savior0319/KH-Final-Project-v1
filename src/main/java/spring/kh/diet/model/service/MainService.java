package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.HealthCenterPDVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.UpdateSSVO;

public interface MainService {

	HealthCenterPDVO getHealthCenterList(int currentPage, String location);
    int insertSessionToList(HttpSession session,HttpServletRequest request);
	ArrayList<OnSessionVO> selectAllSessionList();
	void updateOnsession(UpdateSSVO uSSVO);
	int updateAlreadyOnsession(UpdateSSVO uSSVO);
	ArrayList<AllSessionVO> selectAllSessionList2();
	int autoDeleteSession(AllSessionVO allSessionVO);
	int autoTransSession(AllSessionVO allSessionVO);
}
