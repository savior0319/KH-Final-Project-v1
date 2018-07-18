package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.DietTipPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;

public interface DietTipDAO {

	ArrayList<DietTipVO> selectAllDietTip(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			String type);

	String getDietTipPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage,
			String type);

	DietTipVO getDietTip(SqlSessionTemplate session, int index);
}
