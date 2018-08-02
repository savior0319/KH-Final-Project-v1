package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.TrainerDAO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProgramPageDataVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainerSearchVO;
import spring.kh.diet.model.vo.TrainingRegVO;

@Service("trainerService")
public class TrainerServiceImpl implements TrainerService {

	@Resource(name = "trainerDAO")
	private TrainerDAO trDao;

	@Autowired
	private SqlSessionTemplate session;

	/* 트레이너 인덱스 추출 */
	@Override
	public TrainingRegVO getTrIndex(MemberVO mv) {
		TrainingRegVO trv = trDao.getTrIndex(session, mv);
		return trv;
	}

	/* 주석 어디감ㅡㅡ */
	@Override
	public int registTrainerProgram(TrainerProgramVO tpv) {
		int result = trDao.registTrainerProgram(session, tpv);
		return result;
	}

	/* 주석 어디감ㅡㅡ */
	@Override
	public int trainerReg(TrainingRegVO register) {
		return trDao.trainerReg(session, register);
	}

	/* 주석 어디감ㅡㅡ */
	@Override
	public ProgramPageDataVO getProgramList(int currentPage, int trIndex) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		ProgramPageDataVO ppdv = new ProgramPageDataVO();

		ArrayList<TrainerProgramVO> list = (ArrayList<TrainerProgramVO>) trDao.getProgramList(session, currentPage,
				recordCountPerPage, trIndex);
		String pageNavi = trDao.getProgramListPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage,
				trIndex);

		ppdv.setProList(list);
		ppdv.setPageNavi(pageNavi);
		ppdv.setTrIndex(trIndex);

		return ppdv;
	}

	/* 트레이너 찾기 */
	@Override
	public ArrayList<TrainingRegVO> trainerSearch(TrainerSearchVO tsv) {
		return trDao.trainerSearch(session, tsv);
	}

}
