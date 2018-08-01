package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.TrainerProgramVO;

import spring.kh.diet.model.vo.TrainingRegVO;

public interface TrainerDAO {

	TrainingRegVO getTrIndex(SqlSessionTemplate session, MemberVO mv);

	int registTrainerProgram(SqlSessionTemplate session, TrainerProgramVO tpv);

	int trainerReg(SqlSessionTemplate session, TrainingRegVO register);

}
