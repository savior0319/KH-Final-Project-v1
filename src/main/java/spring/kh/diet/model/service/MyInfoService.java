package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface MyInfoService {

	int question(QuestionVO qv);

	int secessionMember(MemberVO mv);


}
