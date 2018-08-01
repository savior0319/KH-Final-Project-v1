package spring.kh.diet.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.TrainerDAO;
import spring.kh.diet.model.vo.TrainingRegVO;


@Service("trainerService")
public class TrainerServiceImpl  implements TrainerService {

	@Resource(name = "trainerDAO")
	private TrainerDAO trDao;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int trainerReg(TrainingRegVO register) {
		
		return trDao.trainerReg(session, register);
	}
	
	
	
}
