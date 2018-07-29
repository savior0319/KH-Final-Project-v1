package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.MyCommentPageDataVO;
import spring.kh.diet.model.vo.MyPostPageDataVO;
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
	public MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {
		MemberVO mv = sqlSessionTemplate.selectOne("myInfo.selectOneMember", memberVO);
		return mv;
	}

	@Override
	public int deleteMyPicture(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyPicture", mv);
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

	// 아이디 중복 체크
	@Override
	public int idCheck(SqlSessionTemplate sqlSessionTemplate, String id) {
		MemberVO mv = sqlSessionTemplate.selectOne("myInfo.selectOneMember", id);
		int result = 0;
		if (mv != null) {
			result = 1;
		}
		return result;
	}

	// 닉네임 중복 체크
	@Override
	public int nickNameCheck(SqlSessionTemplate sqlSessionTemplate, String nickName) {
		MemberVO mv = sqlSessionTemplate.selectOne("myInfo.nickNameCheck", nickName);
		int result = 0;
		if (mv != null) {
			result = 1;
		}
		return result;
	}

	@Override
	public int updateMyPicture(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.update("myInfo.updateMyPicture", mv);
		return result;
	}

	@Override
	public ArrayList<BoardPostVO> myPost(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		List list = sqlSessionTemplate.selectList("myInfo.myPost", mv);
		return (ArrayList<BoardPostVO>) list;
	}

	@Override
	public ArrayList<BoardCommentVO> myComment(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		List list = sqlSessionTemplate.selectList("myInfo.myComment", mv);
		return (ArrayList<BoardCommentVO>) list;
	}

	@Override
	public ArrayList<BoardBookMarkVO> myBookmark(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		List list = sqlSessionTemplate.selectList("myInfo.myBookMark", mv);
		return (ArrayList<BoardBookMarkVO>) list;
	}

	@Override
	public QuestionVO questionAnswer(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv) {
		QuestionVO answer = sqlSessionTemplate.selectOne("myInfo.questionAnswer", qv);
		return answer;
	}

	/* 마이페이지 - 내 게시물 페이징 처리 출력 */

	@Override
	public ArrayList<BoardPostVO> myPostList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyPostPageDataVO myPost = new MyPostPageDataVO();

		myPost.setStart((currentPage - 1) * recordCountPerPage + 1);
		myPost.setEnd(currentPage * recordCountPerPage);
		myPost.setType(type);
		myPost.setMbIndex(ma.getMbIndex());
		List<BoardPostVO> list = sqlSessionTemplate.selectList("myInfo.myPostList", myPost);
		return (ArrayList<BoardPostVO>) list;
	}

	/* 마이페이지 - 내 게시물 페이징 처리 출력 */

	@Override
	public String myPostListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma) {
		MyPostPageDataVO myPost = new MyPostPageDataVO();
		myPost.setType(type);
		myPost.setMbIndex(ma.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myPostGetNavi", myPost);

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
			sb.append("<a class='item' href='/myPost.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/myPost.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/myPost.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/myPost.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	/* 마이페이지 - 나의 댓글 페이징 처리 */
	@Override
	public ArrayList<BoardCommentVO> myCommentList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyCommentPageDataVO myComment = new MyCommentPageDataVO();

		myComment.setStart((currentPage - 1) * recordCountPerPage + 1);
		myComment.setEnd(currentPage * recordCountPerPage);
		myComment.setType(type);
		myComment.setMbIndex(ma.getMbIndex());

		List<BoardCommentVO> list = sqlSessionTemplate.selectList("myInfo.myCommentList", myComment);

		return (ArrayList<BoardCommentVO>) list;

	}

	@Override
	public String myCommentListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma) {
		MyPostPageDataVO myComment = new MyPostPageDataVO();
		myComment.setType(type);
		myComment.setMbIndex(ma.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myCommentGetNavi", myComment);

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
			sb.append("<a class='item' href='/myComment.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/myComment.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/myComment.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/myComment.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		System.out.println("페이지 토탈 카운트 : " + pageTotalCount);
		return sb.toString();
	}

	@Override
	public ArrayList<BoardPostVO> myBookMarkGetList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyPostPageDataVO cpdv = new MyPostPageDataVO();

		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);

		List<BoardPostVO> list = sqlSessionTemplate.selectList("myInfo.myBookMarkGetList", cpdv);
		return (ArrayList<BoardPostVO>) list;

	}

	@Override
	public ArrayList<BoardPostVO> getCurrentPage(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, MyActivityVO ma) {

		int start = currentPage * recordCountPerPage - (recordCountPerPage - 1);
		int end = currentPage * recordCountPerPage;
		List<BoardPostVO> list = sqlSessionTemplate.selectList("myInfo.myBookMarkGetList", ma);
		return (ArrayList<BoardPostVO>) list;
	}

	@Override
	public String getMyBookMarkGetListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type, MyActivityVO ma) {
		return null;
	}

}
