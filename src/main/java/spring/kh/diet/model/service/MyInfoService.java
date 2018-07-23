package spring.kh.diet.model.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityPageDataVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface MyInfoService {

	int question(QuestionVO qv);

	int secessionMember(MemberVO mv);

	int updateMyPicture(MemberVO mv);

	int updateMyInfo(MemberVO memberVO);

	MemberVO selectOneMember(MemberVO memberVO);

	int deleteMyPicture(String mbId);

	ArrayList<QuestionVO> allMyOneToOneQuestion(MemberVO mv);

	int signupsave(MemberVO mv);

	MyActivityVO myActivity(MemberVO m);

	MyActivityPageDataVO allCommunityList(int currentPage, String type, MyActivityVO ma);

	int idCheck(String id);

	int nickNameCheck(String nickName);

}
