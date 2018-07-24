package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

public interface DietTipDAO {

	ArrayList<DietTipVO> selectAllDietTip(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			DietTipPDVO pdvo);

	String getDietTipPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage,
			DietTipPDVO pdvo);

	DietTipVO getDietTip(SqlSessionTemplate session, int index);

	int registDietTip(SqlSessionTemplate session, DietTipVO dt);
	
}
