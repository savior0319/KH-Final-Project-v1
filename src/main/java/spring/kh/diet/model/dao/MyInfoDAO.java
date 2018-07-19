package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProductVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface MyInfoDAO {

	int question(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv);

	int secessionMember(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int updateMyPicture(MemberVO mv);

	int updateMyInfo(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO);

	int deleteMyPicture(SqlSessionTemplate sqlSessionTemplate, String mbId);

	MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO);

	ArrayList<QuestionVO> allMyOneToOneQuestion(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	ArrayList<ProductVO> myWishList(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int signupsave(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);
}
