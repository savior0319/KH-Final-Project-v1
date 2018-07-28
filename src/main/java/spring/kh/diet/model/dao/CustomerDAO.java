package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.NoticeVO;

public interface CustomerDAO {

	ArrayList<NoticeVO> getNoticeList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getNoticePageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage);


}
