package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;

@Repository(value = "communityDAO")
public class CommunityDAOImpl implements CommunityDAO {

	public CommunityDAOImpl() {
	}

	// 커뮤니티 전체 게시판
	@Override
	public List<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.allCommunityList");
	}

	// 글 등록하러가는곳@!
	@Override
	public int registCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv) {
		int result = sqlSessionTemplate.insert("community.registCommunity", bpv);
		return result;
	}

	// 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력
	@Override
	public ArrayList<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);

		List<BoardPostVO> list = sqlSessionTemplate.selectList("community.allCommunityList", cpdv);

		
		return (ArrayList<BoardPostVO>) list;

	}

	// 페이징 처리 네비
	@Override
	public String getallCommunityListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();
		cpdv.setType(type);
		
		int recordTotalCount = sqlSessionTemplate.selectOne("community.getNavi",cpdv);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) // 시작이 1페이지가 아니라면!
		{
			sb.append("<a class='item' href='/communityWholeBoard.diet?type=" + type + "&currentPage=" + (startNavi - 1)
					+ "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/communityWholeBoard.diet?type="
								+ type + "&currentPage=" + i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/communityWholeBoard.diet?type=" + type + "&currentPage=" + i + "'> "
						+ i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/communityWholeBoard.diet?type=" + type + "&currentPage=" + (endNavi + 1)
					+ "'> &gt; </a>");
		}

		return sb.toString();
	}

	// 식단&레시피
	@Override
	public ArrayList<BoardPostVO> recipeBoardList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type) {
		
		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);

		List<BoardPostVO> list = sqlSessionTemplate.selectList("community.recipeBoardList", cpdv);

		return (ArrayList<BoardPostVO>) list;
	}

	// 페이징 처리 네비
	@Override
	public String getRecipeListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();
		cpdv.setType(type);
		
		int recordTotalCount = sqlSessionTemplate.selectOne("community.getNavi",cpdv);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) // 시작이 1페이지가 아니라면!
		{
			sb.append("<a class='item' href='/recipeBoard.diet?type=" + type + "&currentPage=" + (startNavi - 1)
					+ "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/recipeBoard.diet?type="
								+ type + "&currentPage=" + i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/recipeBoard.diet?type=" + type + "&currentPage=" + i + "'> "
						+ i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/recipeBoard.diet?type=" + type + "&currentPage=" + (endNavi + 1)
					+ "'> &gt; </a>");
		}

		return sb.toString();
	}

	//등록된 글 들어가는 곳
	@Override
	public BoardPostVO postedCommunity(SqlSessionTemplate sqlSessionTemplate, int postIndex) {
		BoardPostVO bpv = sqlSessionTemplate.selectOne("community.postedOne",postIndex);
		
		return bpv;
	}

	// 글삭제
	@Override
	public int deletePost(SqlSessionTemplate sqlSessionTemplate, int postIndex) {
		return sqlSessionTemplate.delete("community.deletePost",postIndex);
	}

	//최신순 & 조회순
	@Override
	public ArrayList<BoardPostVO> viewAllList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, String postSort, String category, String searchText) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		cpdv.setPostSort(postSort);
		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);
		cpdv.setCategory(category);
		cpdv.setSearchText(searchText);
System.out.println(cpdv);
		List<BoardPostVO> list = sqlSessionTemplate.selectList("community.viewList", cpdv);
		
		return (ArrayList<BoardPostVO>) list;
	}

	//레시피 식단 최신순 & 조회순
	@Override
	public ArrayList<BoardPostVO> recipeViewList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type, String postSort) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		cpdv.setPostSort(postSort);
		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);

		List<BoardPostVO> list = sqlSessionTemplate.selectList("community.recipeViewList", cpdv);

		return (ArrayList<BoardPostVO>) list;
	}

	@Override
	public ArrayList<BoardPostVO> searchList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String searchText, String category) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();
		
		cpdv.setSearchText(searchText);
		cpdv.setCategory(category);
		cpdv.setSearchText(searchText);
		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		

		List<BoardPostVO> list = sqlSessionTemplate.selectList("community.searchList", cpdv);
		
		return (ArrayList<BoardPostVO>) list;
	}

	@Override
	public String getSearchListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String searchText, String category) {
		CommunityPageDataVO cpdv = new CommunityPageDataVO();
		
		cpdv.setSearchText(searchText);
		cpdv.setCategory(category);
		
		int recordTotalCount = sqlSessionTemplate.selectOne("community.getSearchNavi",cpdv);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) // 시작이 1페이지가 아니라면!
		{
			sb.append("<a class='item' href='/communityWholeBoard.diet?category"+category+"&searchText=" + searchText + "&currentPage=" + (startNavi - 1)
					+ "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/communityWholeBoard.diet?category"+category+"&searchText="
								+ searchText + "&currentPage=" + i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/communityWholeBoard.diet?category"+category+"&searchText=" + searchText + "&currentPage=" + i + "'> "
						+ i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/communityWholeBoard.diet?category"+category+"&searchText=" + searchText + "&currentPage=" + (endNavi + 1)
					+ "'> &gt; </a>");
		}

		return sb.toString();
	}

	public int postHit(SqlSessionTemplate sqlSessionTemplate, int postIndex) {
		int result = sqlSessionTemplate.update("community.postHit", postIndex);
		return 0;
	}
}
