package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;

public interface CommonService {

	BoardCommentPDVO getComment(int currentPage, String servletName, int indexNo);

	int addComment(BoardCommentVO bc);

	int deleteComment(int commentIndex);

	int modifyComment(BoardCommentVO bc);

	int cmdCountUp(BoardPostVO bpv);

	int cmdCount(BoardCommentVO bc);

	int cmdDelCount(int parseInt);

	BoardBlameVO checkPostBlame(BoardBlameVO checkBlame);

	int blameCmd(BoardBlameVO report);

	int cmtBlameUp(BoardBlameVO report);



}
