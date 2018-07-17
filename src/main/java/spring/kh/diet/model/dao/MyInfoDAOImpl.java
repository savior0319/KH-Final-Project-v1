package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;
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


}
