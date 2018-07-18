package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository(value = "communityDAO")
public class CommunityDAOImpl implements CommunityDAO{

	public CommunityDAOImpl() {
		
	}
	
	@Override
	public List allCommunityList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.allCommunityList");
	}

	@Override
	public List beforeAfterList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.beforeAfterList");
	}


}

