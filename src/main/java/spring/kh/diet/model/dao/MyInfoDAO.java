package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.QuestionVO;

public interface MyInfoDAO {

	int question(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv);

}
