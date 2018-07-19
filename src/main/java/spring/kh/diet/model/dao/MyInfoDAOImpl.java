package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProductVO;
import spring.kh.diet.model.vo.QuestionVO;

@Repository("myInfoDAO")
public class MyInfoDAOImpl implements MyInfoDAO {

	@Override
	public int question(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv) {
		int result = sqlSessionTemplate.insert("myInfo.question", qv);
		return result;
	}

	@Override
	public int secessionMember(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.delete("myInfo.secessionMember", mv);
		return result;
	}

	@Override
	public int updateMyInfo(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {
		int result = sqlSessionTemplate.update("myInfo.updateMyInfo", memberVO);
		return result;
	}

	@Override
	public int updateMyPicture(MemberVO mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {
		MemberVO mv = sqlSessionTemplate.selectOne("myInfo.selectOneMember", memberVO);
		return mv;
	}

	@Override
	public int deleteMyPicture(SqlSessionTemplate sqlSessionTemplate, String mbId) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyPicture", mbId);
		return result;
	}

	@Override
	public ArrayList<QuestionVO> allMyOneToOneQuestion(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		List list = sqlSessionTemplate.selectList("myInfo.allMyOneToOneQuestion", mv);
		return (ArrayList<QuestionVO>) list;
	}


	@Override
	public int signupsave(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.insert("myInfo.signup", mv);
		return result;
	}

}
