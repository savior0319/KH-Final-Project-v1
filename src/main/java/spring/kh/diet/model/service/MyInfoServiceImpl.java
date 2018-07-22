package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.MyInfoDAO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityPageDataVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.QuestionVO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService {

	@Resource(name = "myInfoDAO")
	private MyInfoDAO myInfoDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public int question(QuestionVO qv) {
		int result = myInfoDAO.question(SqlSessionTemplate, qv);
		return result;
	}

	@Override
	public int secessionMember(MemberVO mv) {
		int result = myInfoDAO.secessionMember(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public int updateMyPicture(MemberVO mv) {

		return 0;
	}

	@Override
	public int updateMyInfo(MemberVO memberVO) {
		int result = myInfoDAO.updateMyInfo(SqlSessionTemplate, memberVO);
		return result;
	}

	@Override
	public MemberVO selectOneMember(MemberVO memberVO) {
		MemberVO mv = myInfoDAO.selectOneMember(SqlSessionTemplate, memberVO);
		return mv;
	}

	@Override
	public int deleteMyPicture(String mbId) {
		int result = myInfoDAO.deleteMyPicture(SqlSessionTemplate, mbId);
		return result;
	}

	@Override
	public ArrayList<QuestionVO> allMyOneToOneQuestion(MemberVO mv) {
		ArrayList<QuestionVO> list = myInfoDAO.allMyOneToOneQuestion(SqlSessionTemplate, mv);
		return list;
	}

	@Override
	public int signupsave(MemberVO mv) {
		int result = myInfoDAO.signupsave(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public MyActivityVO myActivity(MemberVO m) {
		MyActivityVO ma = myInfoDAO.myActivity(SqlSessionTemplate, m);
		return ma;
	}

	@Override
	public MyActivityPageDataVO allCommunityList(int currentPage, String type, MyActivityVO ma) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		MyActivityPageDataVO cpdv = new MyActivityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) myInfoDAO.allCommunityList(SqlSessionTemplate,
				currentPage, recordCountPerPage, type, ma);
		String pageNavi = myInfoDAO.getallCommunityListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type, ma);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);

		return cpdv;
	}

	@Override
	public int idCheck(String id) {
		int result = myInfoDAO.idCheck(SqlSessionTemplate, id);
		return result;
	}

}
