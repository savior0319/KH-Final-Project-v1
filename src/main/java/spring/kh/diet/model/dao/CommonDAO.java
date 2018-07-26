package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardCommentVO;

public interface CommonDAO {

	ArrayList<BoardCommentVO> selectAllComment(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int indexNo);

	String getCommentPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage,String servletName, int indexNo);

	int getTotalCommentNo(SqlSessionTemplate session, int indexNo);

	int addComment(SqlSessionTemplate session, BoardCommentVO bc);

	int deleteComment(SqlSessionTemplate session, int commentIndex);


}
