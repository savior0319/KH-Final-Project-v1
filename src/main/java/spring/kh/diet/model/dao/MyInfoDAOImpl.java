package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.ApplyTrainerPDVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.MyBookMarkPageDataVO;
import spring.kh.diet.model.vo.MyCommentPageDataVO;
import spring.kh.diet.model.vo.MyPostPageDataVO;
import spring.kh.diet.model.vo.MyQuestionPageDataVO;
import spring.kh.diet.model.vo.MyRequestTrainerPDVO;
import spring.kh.diet.model.vo.OneSessionVO;
import spring.kh.diet.model.vo.PaymentPDVO;
import spring.kh.diet.model.vo.PaymentVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainingRegVO;

@SuppressWarnings("all")
@Repository("myInfoDAO")
public class MyInfoDAOImpl implements MyInfoDAO {

	@Override
	public int deleteMyPost(SqlSessionTemplate sqlSessionTemplate, BoardPostVO pv) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyPost", pv);
		return result;
	}

	@Override
	public int deleteMyBookMark(SqlSessionTemplate sqlSessionTemplate, BoardBookMarkVO pv) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyBookMark", pv);
		return result;
	}

	@Override
	public int deleteMyComment(SqlSessionTemplate sqlSessionTemplate, BoardCommentVO pv) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyComment", pv);
		return result;
	}

	public int deleteMyQuestion(SqlSessionTemplate sqlSessionTemplate, QuestionVO pv) {
		int result = sqlSessionTemplate.delete("myInfo.deleteMyQuestion", pv);
		return result;
	}

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

	@Override
	public int myLoginCount(SqlSessionTemplate sqlSessionTemplate, MemberVO m) {
		int mv = sqlSessionTemplate.selectOne("myInfo.myCount", m);
		return mv;
	}

	@Override
	public OneSessionVO selectOneSession(SqlSessionTemplate sqlSessionTemplate, String id) {

		OneSessionVO OSV = sqlSessionTemplate.selectOne("login.selectOneSession", id);
		return OSV;
	}

	@Override
	public void tranSession(SqlSessionTemplate sqlSessionTemplate, String id) {
		sqlSessionTemplate.delete("login.transSession", id);

	}

	@Override
	public int insertSession(SqlSessionTemplate sqlSessionTemplate, OneSessionVO oSV) {
		int result = sqlSessionTemplate.insert("login.insertSession", oSV);
		return result;
	}

	/* 마이페이지 - 트레이너, 구매여부 체크 */
	@Override
	public ArrayList<TrainerProgramVO> checkSale(SqlSessionTemplate sqlSessionTemplate, TrainerProgramVO tv) {

		List<TrainerProgramVO> list = sqlSessionTemplate.selectList("myInfo.checkSale", tv);

		return (ArrayList) list;
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
		return sb.toString();
	}

	@Override
	public String myBookMarkListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma) {
		MyBookMarkPageDataVO myBookMark = new MyBookMarkPageDataVO();
		myBookMark.setType(type);
		myBookMark.setMbIndex(ma.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myBookMarkGetNavi", myBookMark);
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
			sb.append("<a class='item' href='/myBookMark.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/myBookMark.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/myBookMark.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/myBookMark.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public ArrayList<BoardBookMarkVO> myBookMarkList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyBookMarkPageDataVO myBookMark = new MyBookMarkPageDataVO();

		myBookMark.setStart((currentPage - 1) * recordCountPerPage + 1);
		myBookMark.setEnd(currentPage * recordCountPerPage);
		myBookMark.setType(type);
		myBookMark.setMbIndex(ma.getMbIndex());

		List<BoardBookMarkVO> list = sqlSessionTemplate.selectList("myInfo.myBookMarkList", myBookMark);

		return (ArrayList<BoardBookMarkVO>) list;

	}

	@Override
	public ArrayList<QuestionVO> myQuestionList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, MyActivityVO mv) {
		MyQuestionPageDataVO myQuestion = new MyQuestionPageDataVO();

		myQuestion.setStart((currentPage - 1) * recordCountPerPage + 1);
		myQuestion.setEnd(currentPage * recordCountPerPage);
		myQuestion.setMbIndex(mv.getMbIndex());

		List<QuestionVO> list = sqlSessionTemplate.selectList("myInfo.myQuestionList", myQuestion);

		return (ArrayList<QuestionVO>) list;
	}

	@Override
	public String myQuestionListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, MyActivityVO mv) {
		MyQuestionPageDataVO myQuestion = new MyQuestionPageDataVO();
		myQuestion.setMbIndex(mv.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myQuestionGetNavi", myQuestion);
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
			sb.append("<a class='item' href='/allMyOneToOneQuestion.diet?currentPage=" + (startNavi - 1)
					+ "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/allMyOneToOneQuestion.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/allMyOneToOneQuestion.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append(
					"<a class='item' href='/allMyOneToOneQuestion.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public ArrayList<TrainerProgramVO> requestTrainerList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, TrainerProgramVO tv) {
		MyRequestTrainerPDVO myRequest = new MyRequestTrainerPDVO();

		myRequest.setStart((currentPage - 1) * recordCountPerPage + 1);
		myRequest.setEnd(currentPage * recordCountPerPage);
		myRequest.setMbIndex(tv.getMbIndex());

		List<TrainerProgramVO> list = sqlSessionTemplate.selectList("myInfo.myRequestList", myRequest);

		return (ArrayList<TrainerProgramVO>) list;
	}

	@Override
	public String requestTrainerListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, TrainerProgramVO tv) {
		MyRequestTrainerPDVO myRequest = new MyRequestTrainerPDVO();
		myRequest.setMbIndex(tv.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myRequestGetNavi", myRequest);
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
			sb.append("<a class='item' href='/applyTrainer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/applyTrainer.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/applyTrainer.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/applyTrainer.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public ArrayList<TrainingRegVO> applyTrainerList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, TrainingRegVO tv) {
		ApplyTrainerPDVO applyTrainer = new ApplyTrainerPDVO();

		applyTrainer.setStart((currentPage - 1) * recordCountPerPage + 1);
		applyTrainer.setEnd(currentPage * recordCountPerPage);
		applyTrainer.setMbIndex(tv.getMbIndex());

		List<TrainingRegVO> list = sqlSessionTemplate.selectList("myInfo.applyTrainerList", applyTrainer);

		return (ArrayList<TrainingRegVO>) list;
	}

	@Override
	public String applyTrainerListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, TrainingRegVO tv) {
		ApplyTrainerPDVO applyTrainer = new ApplyTrainerPDVO();
		applyTrainer.setMbIndex(tv.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.applyTrainerGetNavi", applyTrainer);
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
			sb.append("<a class='item' href='/applyTrainer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/applyTrainer.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/applyTrainer.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/applyTrainer.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public ArrayList<TrainingRegVO> applyTrainerList2(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, TrainingRegVO tr) {
		ApplyTrainerPDVO applyTrainer = new ApplyTrainerPDVO();

		applyTrainer.setStart((currentPage - 1) * recordCountPerPage + 1);
		applyTrainer.setEnd(currentPage * recordCountPerPage);
		applyTrainer.setMbIndex(tr.getMbIndex());

		List<TrainingRegVO> list = sqlSessionTemplate.selectList("myInfo.applyTrainerList2", applyTrainer);

		return (ArrayList<TrainingRegVO>) list;
	}

	@Override
	public String applyTrainerListPageNavi2(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, TrainingRegVO tr) {
		ApplyTrainerPDVO applyTrainer = new ApplyTrainerPDVO();
		applyTrainer.setMbIndex(tr.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.applyTrainerGetNavi2", applyTrainer);
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
			sb.append("<a class='item' href='/requestTrainer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/requestTrainer.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/requestTrainer.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/requestTrainer.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public ArrayList<TrainerProgramVO> requestTrainerList2(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, TrainerProgramVO tv) {
		MyRequestTrainerPDVO myRequest = new MyRequestTrainerPDVO();

		myRequest.setStart((currentPage - 1) * recordCountPerPage + 1);
		myRequest.setEnd(currentPage * recordCountPerPage);
		myRequest.setMbIndex(tv.getMbIndex());

		List<TrainerProgramVO> list = sqlSessionTemplate.selectList("myInfo.myRequestList2", myRequest);

		return (ArrayList<TrainerProgramVO>) list;
	}

	@Override
	public String requestTrainerListPageNavi2(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, TrainerProgramVO tv) {
		MyRequestTrainerPDVO myRequest = new MyRequestTrainerPDVO();
		myRequest.setMbIndex(tv.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myRequestGetNavi2", myRequest);
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
			sb.append("<a class='item' href='/requestTrainer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/requestTrainer.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/requestTrainer.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/requestTrainer.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public TrainingRegVO myTrainingReg(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		TrainingRegVO trv = sqlSessionTemplate.selectOne("myInfo.myTrainingReg",mv);
		return trv;
	}

	@Override
	public ArrayList<TrainerProgramVO> requestTrainerList3(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, TrainerProgramVO tv) {
		MyRequestTrainerPDVO myRequest = new MyRequestTrainerPDVO();

		myRequest.setStart((currentPage - 1) * recordCountPerPage + 1);
		myRequest.setEnd(currentPage * recordCountPerPage);
		myRequest.setMbIndex(tv.getMbIndex());

		List<TrainerProgramVO> list = sqlSessionTemplate.selectList("myInfo.myRequestList2", myRequest);

		return (ArrayList<TrainerProgramVO>) list;
	}

	@Override
	public String requestTrainerListPageNavi3(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, TrainerProgramVO tv) {
		MyRequestTrainerPDVO myRequest = new MyRequestTrainerPDVO();
		myRequest.setMbIndex(tv.getMbIndex());

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.myRequestGetNavi2", myRequest);
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
			sb.append("<a class='item' href='/applyTrainer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/applyTrainer.diet?currentPage="
								+ i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/applyTrainer.diet?currentPage=" + i + "'>" + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/applyTrainer.diet?&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	@Override
	public int canclePro(SqlSessionTemplate sqlSessionTemplate, PaymentVO pv) {
		int result = sqlSessionTemplate.delete("myInfo.canclePro",pv);
		return result;
	}

	@Override
	public ArrayList<PaymentVO> checkPur(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		List <PaymentVO> list = sqlSessionTemplate.selectList("myInfo.checkPur",mv);
		return (ArrayList<PaymentVO>)list;
	}

}
