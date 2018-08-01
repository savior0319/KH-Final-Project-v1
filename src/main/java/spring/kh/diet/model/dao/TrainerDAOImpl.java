package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.TrainingRegVO;

@Repository(value = "trainerDAO")
public class TrainerDAOImpl implements TrainerDAO {

	public TrainerDAOImpl() {
		
	}

	@Override
	public int trainerReg(SqlSessionTemplate session, TrainingRegVO register) {
		int result = session.insert("trainer.trainerReg",register);
		System.out.println("결과아아아!"+result);
		return result;
	}
	
}
