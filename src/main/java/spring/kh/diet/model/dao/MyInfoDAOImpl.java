package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityPageDataVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.QuestionVO;

@SuppressWarnings("all")
@Repository("myInfoDAO")
public class MyInfoDAOImpl implements MyInfoDAO {

	@Override
	public int question(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv) {
		int result = sqlSessionTemplate.insert("myInfo.question", qv);
		return result;
	}

	@Override
	public int secessionMember(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.delete("myInfo.secessionMember", mv);
		return result;
	}

	@Override
	public int updateMyInfo(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {
		int result = sqlSessionTemplate.update("myInfo.updateMyInfo", memberVO);
		return result;
	}

	@Override
	public int updateMyPicture(MemberVO mv) {
		return 0;
	}

	@Override
	public MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {
		MemberVO mv = sqlSessionTemplate.selectOne("myInfo.selectOneMember", memberVO);
		return mv;
	}

	@Override
	public int deleteMyPicture(SqlSessionTemplate sqlSessionTemplate, String mbId) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyPicture", mbId);
		return result;
	}

	@Override
	public ArrayList<QuestionVO> allMyOneToOneQuestion(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		List<?> list = sqlSessionTemplate.selectList("myInfo.allMyOneToOneQuestion", mv);
		return (ArrayList<QuestionVO>) list;
	}

	@Override
	public int signupsave(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.insert("myInfo.signup", mv);
		return result;
	}

	@Override
	public MyActivityVO myActivity(SqlSessionTemplate sqlSessionTemplate, MemberVO m) {
		MyActivityVO ma = sqlSessionTemplate.selectOne("myInfo.myActivity", m);
		return ma;
	}

	// 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력

	@Override
	public ArrayList<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyActivityPageDataVO cpdv = new MyActivityPageDataVO();

		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);

		List<BoardPostVO> list = sqlSessionTemplate.selectList("myInfo.allCommunityList", cpdv);

		return (ArrayList<BoardPostVO>) list;
	}

	@Override
	public String getallCommunityListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type, MyActivityVO ma) {
		MyActivityPageDataVO cpdv = new MyActivityPageDataVO();
		cpdv.setType(type);

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.getNavi", cpdv);

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
}
