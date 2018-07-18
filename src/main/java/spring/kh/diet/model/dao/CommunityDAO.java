package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface CommunityDAO {

	static List allCommunityList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.allCommunityList");
	}

}
