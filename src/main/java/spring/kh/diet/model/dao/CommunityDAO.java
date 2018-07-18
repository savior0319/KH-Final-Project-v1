package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface CommunityDAO {

	List allCommunityList(SqlSessionTemplate sqlSessionTemplate);

	List beforeAfterList(SqlSessionTemplate sqlSessionTemplate);


}
