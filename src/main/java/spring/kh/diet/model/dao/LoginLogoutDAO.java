package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.OneSessionVO;

public interface LoginLogoutDAO {

	MemberVO findId(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	MemberVO login(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int updatePassword(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int joinKaKao(SqlSessionTemplate sqlSessionTemplate, MemberVO m);

	OneSessionVO selectOneSession(SqlSessionTemplate sqlSessionTemplate, String remoteAddr);

}
