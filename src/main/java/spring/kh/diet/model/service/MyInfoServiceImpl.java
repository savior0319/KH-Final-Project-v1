package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.MyInfoDAO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.QuestionVO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService {

	@Resource(name = "myInfoDAO")
	private MyInfoDAO MyInfoDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public int question(QuestionVO qv) {
		int result = MyInfoDAO.question(SqlSessionTemplate, qv);
		return result;
	}
	@Override
	public int secessionMember(MemberVO mv) {
		int result = MyInfoDAO.secessionMember(SqlSessionTemplate, mv);
		return result;
	}
	@Override
	public int updateMyPicture(MemberVO mv) {
	
		return 0;
	}
	
	@Override
	public int updateMyInfo(MemberVO memberVO) {
		int result = MyInfoDAO.updateMyInfo(SqlSessionTemplate,memberVO);
		return result;
	}
	@Override
	public MemberVO selectOneMember(MemberVO memberVO) {
		MemberVO mv = MyInfoDAO.selectOneMember(SqlSessionTemplate,memberVO);
		return mv;
	}
	@Override
	public int deleteMyPicture(String mbId) {
		int result = MyInfoDAO.deleteMyPicture(SqlSessionTemplate,mbId);
		return result;
	}
	@Override
	public ArrayList<QuestionVO> allMyOneToOneQuestion(MemberVO mv) {
		ArrayList<QuestionVO> list = MyInfoDAO.allMyOneToOneQuestion(SqlSessionTemplate,mv);
		return list;
	}

}
