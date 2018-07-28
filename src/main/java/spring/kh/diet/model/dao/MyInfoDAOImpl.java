package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
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
	public MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO) {

		MemberVO mv = sqlSessionTemplate.selectOne("myInfo.selectOneMember", memberVO);
		System.out.println("업뎃된 이미지?" + mv.getMbImage());
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
		System.out.println("dao ma:" + ma);
		return ma;
	}

	/* 마이페이지 - 내 게시물 페이징 처리 출력 */

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

	/* 마이페이지 - 내 게시물 페이징 처리 출력 */

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
	public ArrayList<BoardPostVO> myBookMarkGetList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyActivityPageDataVO cpdv = new MyActivityPageDataVO();

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<BoardPostVO> myCommentGetList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma) {
		MyActivityPageDataVO cpdv = new MyActivityPageDataVO();

		cpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		cpdv.setEnd(currentPage * recordCountPerPage);
		cpdv.setType(type);

		List<BoardPostVO> list = sqlSessionTemplate.selectList("myInfo.myCommentGetList", cpdv);

		return (ArrayList<BoardPostVO>) list;
	}

	@Override
	public String getMyCommentListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type, MyActivityVO ma) {
		MyActivityPageDataVO cpdv = new MyActivityPageDataVO();
		cpdv.setType(type);

		int recordTotalCount = sqlSessionTemplate.selectOne("myInfo.getNaviComment", cpdv);

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
	public QuestionVO questionAnswer(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv) {
		System.out.println("다오:"+qv.getMbIndex() +qv.getQsIndex());
		QuestionVO answer = sqlSessionTemplate.selectOne("myInfo.questionAnswer", qv);
		System.out.println("다오" + answer);
		return answer;
	}

}
