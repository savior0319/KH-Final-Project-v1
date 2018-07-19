package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.MemberVO;

public interface LoginLogoutService {

	MemberVO login(MemberVO mv);
	MemberVO findId(MemberVO mv);
	int updatePassword(MemberVO mv);

}
