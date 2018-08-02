package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.TrainerDAO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainerSearchVO;
import spring.kh.diet.model.vo.TrainingRegVO;


@Service("trainerService")
public class TrainerServiceImpl  implements TrainerService {

	@Resource(name = "trainerDAO")
	private TrainerDAO trDao;

	@Autowired
	private SqlSessionTemplate session;

	/* 트레이너 인덱스 추출 */
	@Override
	public TrainingRegVO getTrIndex(MemberVO mv) {
		TrainingRegVO trv = trDao.getTrIndex(session,mv);
		return trv;
	}

	@Override
	public int registTrainerProgram(TrainerProgramVO tpv) {
		int result = trDao.registTrainerProgram(session,tpv);
		return result;
  }

	@Override
	public int trainerReg(TrainingRegVO register) {
		return trDao.trainerReg(session, register);
	}

	/* 트레이너 찾기 */
	@Override
	public ArrayList<TrainingRegVO> trainerSearch(TrainerSearchVO tsv) {
		return trDao.trainerReg(session, tsv);
	}
	
	
	
}
