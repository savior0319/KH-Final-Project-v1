package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainingRegVO;

@Repository(value = "trainerDAO")
public class TrainerDAOImpl implements TrainerDAO {

	public TrainerDAOImpl() {
		
	}

	@Override
	public TrainingRegVO getTrIndex(SqlSessionTemplate session, MemberVO mv) {
		TrainingRegVO trv = session.selectOne("trainer.getTrIndex", mv);
		return trv;
	}

	@Override
	public int registTrainerProgram(SqlSessionTemplate session, TrainerProgramVO tpv) {
		return session.insert("trainer.registTrainerProgram",tpv);
  }

	public int trainerReg(SqlSessionTemplate session, TrainingRegVO register) {
		int result = session.insert("trainer.trainerReg",register);

		return result;
	}
	
}
