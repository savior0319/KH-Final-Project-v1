package spring.kh.diet.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.MyInfoDAO;
import spring.kh.diet.model.vo.QuestionVO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService {

	@Resource(name = "myInfoDAO")
	private MyInfoDAO MyInfoDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public int question(QuestionVO qv) {
		int result = MyInfoDAO.question(SqlSessionTemplate, qv);
		return result;
	}

}
