package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardPostVO;

public interface CommunityDAO {

	List<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate);

	int registCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv);

	String getallCommunityListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type);

	ArrayList<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type);

	String getRecipeListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type);

	ArrayList<BoardPostVO> recipeBoardList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type);

	BoardPostVO postedCommunity(SqlSessionTemplate sqlSessionTemplate, int postIndex);

	int deletePost(SqlSessionTemplate sqlSessionTemplate, int postIndex);

}
