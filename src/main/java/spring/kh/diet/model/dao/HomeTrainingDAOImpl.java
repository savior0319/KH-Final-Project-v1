package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.HomeTrainingLikeVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;

@Repository("homeTrainingDAO")
public class HomeTrainingDAOImpl implements HomeTrainingDAO {

	@Override
	public ArrayList<HomeTrainingVO> selectAllHomeTraining(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, HomeTrainingPageDataVO pdvo) {

		pdvo.setStart((currentPage - 1) * recordCountPerPage + 1);
		pdvo.setEnd(currentPage * recordCountPerPage);

		List<HomeTrainingVO> list = session.selectList("homeTraining.getList", pdvo);

		return (ArrayList<HomeTrainingVO>) list;
	}

	@Override
	public String homeTrainingPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, HomeTrainingPageDataVO pdvo) {

		int recordTotalCount = session.selectOne("homeTraining.getNavi", pdvo);

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

		if (pdvo.getCategory() != null && pdvo.getSearchText() != null) { // 검색했을 때의 내비

			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingList.diet?type=" + pdvo.getType() + "&currentPage="
						+ (startNavi - 1) + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText()
						+ "'> &lt; </a>");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				if (i == currentPage) {
					sb.append(
							"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/homeTrainingList.diet?type="
									+ pdvo.getType() + "&currentPage=" + i + "&category=" + pdvo.getCategory()
									+ "&searchText=" + pdvo.getSearchText() + "'><strong>" + i + "</strong></a>");
				} else {
					sb.append("<a class='item' href='/homeTrainingList.diet?type=" + pdvo.getType() + "&currentPage="
							+ i + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText() + "'> " + i
							+ " </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingList.diet?type=" + pdvo.getType() + "&currentPage="
						+ (endNavi + 1) + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText()
						+ "'> &gt; </a>");
			}

		} else { // 검색하지 않았을 때의 내비

			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingList.diet?type=" + pdvo.getType() + "&currentPage="
						+ (startNavi - 1) + "'> &lt; </a>");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				if (i == currentPage) {
					sb.append(
							"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/homeTrainingList.diet?type="
									+ pdvo.getType() + "&currentPage=" + i + "'><strong>" + i + "</strong></a>");
				} else {
					sb.append("<a class='item' href='/homeTrainingList.diet?type=" + pdvo.getType() + "&currentPage="
							+ i + "'> " + i + " </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingList.diet?type=" + pdvo.getType() + "&currentPage="
						+ (endNavi + 1) + "'> &gt; </a>");
			}

		}

		return sb.toString();

	}

	@Override
	public HomeTrainingVO homeTraining(SqlSessionTemplate session, int indexNo) {
		HomeTrainingVO ht = session.selectOne("homeTraining.getOne", indexNo);
		return ht;
	}

	// 이전글 다음글
	@Override
	public ArrayList<HomeTrainingVO> pnWriteList(SqlSessionTemplate session, int indexNo) {
		// List<HomeTrainingVO> list = session.selectList("homeTraining.getpnWriteList",
		// indexNo);
		// return (ArrayList<HomeTrainingVO>)list;
		return null;
	}

	// 좋아요 부분
	@Override
	public BoardLikeVO checkBoardLike(SqlSessionTemplate session, BoardLikeVO checkVO) {
		BoardLikeVO blv = session.selectOne("homeTraining.checkLike", checkVO);
		return blv;
	}

	@Override
	public int boardLikeDown(SqlSessionTemplate session, BoardLikeVO blv) {
		int result = session.delete("homeTraining.likeDown", blv);
		return result;
	}

	@Override
	public int postLikeDown(SqlSessionTemplate session, BoardLikeVO blv) {
		int result = session.update("homeTraining.postDown", blv);
		return result;
	}

	@Override
	public int boardLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO) {
		int result = session.insert("homeTraining.likeUp", checkVO);
		return result;
	}

	@Override
	public int postLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO) {
		int result = session.update("homeTraining.postUp", checkVO);
		return result;
	}

	@Override
	public int homeTrainingHits(SqlSessionTemplate session, int hits) {
		System.out.println(hits);
		int result = session.update("homeTraining.hits", hits);
		return result;
	}

	public String homeTrainingAllPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, HomeTrainingPageDataVO pdvo) {
		
		int recordTotalCount = session.selectOne("homeTraining.getNavi", pdvo);

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

		if (pdvo.getCategory() != null && pdvo.getSearchText() != null) { // 검색했을 때의 내비

			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingAll.diet?currentPage="
						+ (startNavi - 1) + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText()
						+ "'> &lt; </a>");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				if (i == currentPage) {
					sb.append(
							"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/homeTrainingAll.diet?currentPage=" + i + "&category=" + pdvo.getCategory()
									+ "&searchText=" + pdvo.getSearchText() + "'><strong>" + i + "</strong></a>");
				} else {
					sb.append("<a class='item' href='/homeTrainingAll.diet?currentPage="
							+ i + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText() + "'> " + i
							+ " </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingAll.diet?currentPage="
						+ (endNavi + 1) + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText()
						+ "'> &gt; </a>");
			}

		} else { // 검색하지 않았을 때의 내비

			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingAll.diet?currentPage="
						+ (startNavi - 1) + "'> &lt; </a>");
			}

			for (int i = startNavi; i <= endNavi; i++) {
				if (i == currentPage) {
					sb.append(
							"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/homeTrainingAll.diet?currentPage=" + i + "'><strong>" + i + "</strong></a>");
				} else {
					sb.append("<a class='item' href='/homeTrainingAll.diet?currentPage="
							+ i + "'> " + i + " </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/homeTrainingAll.diet?currentPage="
						+ (endNavi + 1) + "'> &gt; </a>");
			}

		}

		return sb.toString();
		
	}

}
