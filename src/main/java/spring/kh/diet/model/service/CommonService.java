package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardCommentVO;

public interface CommonService {

	BoardCommentPDVO getComment(int currentPage, String servletName, int indexNo);

	int addComment(BoardCommentVO bc);

	int deleteComment(int commentIndex);

	int modifyComment(BoardCommentVO bc);

}
