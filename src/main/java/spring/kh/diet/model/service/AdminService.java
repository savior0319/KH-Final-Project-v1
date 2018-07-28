package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface AdminService {

	int noticeRegisterData(NoticeVO nv);

	MemberListPDVO getMemberList(int currentPage);

	MemberListPDVO getDeleteMemberList(int currentPage);

	QuestionAnswerPDVO getAnswerList(int currentPage);

	QuestionVO getQuestionContent(int index);

	AllSessionListPDVO getSessionList(int currentPage);

}
