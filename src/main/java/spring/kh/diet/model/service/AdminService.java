package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.NoticeVO;

public interface AdminService {

	int noticeRegisterData(NoticeVO nv);

	MemberListPDVO getMemberList(int currentPage);

	MemberListPDVO getDeleteMemberList(int currentPage);

}
