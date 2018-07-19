package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.MemberVO;

public interface LoginLogoutDAO {

	MemberVO findId(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

}
