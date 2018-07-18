package spring.kh.diet.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CommunityDAO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Resource(name = "communityDAO")
	private CommunityDAO communityDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public List allCommunityList() {
		List list = communityDAO.allCommunityList(SqlSessionTemplate);
		return list;
	}
	
	
	
	
}
