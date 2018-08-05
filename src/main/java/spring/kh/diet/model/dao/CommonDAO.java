package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;

public interface CommonDAO {

	ArrayList<BoardCommentVO> selectAllComment(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int indexNo);

	String getCommentPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage,String servletName, int indexNo);

	int getTotalCommentNo(SqlSessionTemplate session, int indexNo);

	int addComment(SqlSessionTemplate session, BoardCommentVO bc);

	int deleteComment(SqlSessionTemplate session, int commentIndex);

	int modifyComment(SqlSessionTemplate session, BoardCommentVO bc);

	int cmdCount(SqlSessionTemplate session, BoardCommentVO bc);

	int cmdCountUp(SqlSessionTemplate session, BoardPostVO bpv);

	int cmdDelCount(SqlSessionTemplate session, int parseInt);

	BoardBlameVO checkPostBlame(SqlSessionTemplate session, BoardBlameVO checkBlame);

	int blameCmd(SqlSessionTemplate session, BoardBlameVO report);

	int cmtBlameUp(SqlSessionTemplate session, BoardBlameVO report);

	ArrayList<AdvertiseVO> advertiseImageLoad(SqlSessionTemplate session);

}
