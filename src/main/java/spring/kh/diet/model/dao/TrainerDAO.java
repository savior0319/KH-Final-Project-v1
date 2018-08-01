package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.TrainingRegVO;

public interface TrainerDAO {

	int trainerReg(SqlSessionTemplate session, TrainingRegVO register);

}
