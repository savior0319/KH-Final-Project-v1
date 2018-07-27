package spring.kh.diet.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.OneSessionVO;

public interface LoginLogoutService {

	MemberVO login(MemberVO mv);
	MemberVO findId(MemberVO mv);
	int updatePassword(MemberVO mv);
	int updateMypass(MemberVO mv);
	MemberVO kakaoLoginService(MemberVO mv);
	int existUserNickNum(MemberVO mv);
	int existUserFindingId(MemberVO mv);
	int joinKaKao(MemberVO m);
	void transSession(String string);
	OneSessionVO selectOneSession(String remoteAddr);
	int insertSession(OneSessionVO oSV);

}
