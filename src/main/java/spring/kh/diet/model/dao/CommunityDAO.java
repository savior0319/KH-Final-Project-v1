package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardPostVO;

public interface CommunityDAO {

	List allCommunityList(SqlSessionTemplate sqlSessionTemplate);

	int registCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv);



}
