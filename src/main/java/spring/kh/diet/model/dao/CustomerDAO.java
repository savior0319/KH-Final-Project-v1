package spring.kh.diet.model.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.NoticeVO;

public interface CustomerDAO {

	ArrayList<NoticeVO> getNoticeList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getNoticePageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage);

	NoticeVO noticeContent(HttpSession sessionCheck, SqlSessionTemplate session, int index, HttpServletResponse response,
			HttpServletRequest request);

	int noticeHit(SqlSessionTemplate session, int index);

}
