package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.kh.diet.model.dao.TrainerDAO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.PaymentVO;
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

	/* 프로그램 등록 */
	@Override
	public int registTrainerProgram(TrainerProgramVO tpv) {
		int result = trDao.registTrainerProgram(session, tpv);
		return result;
	}

	/* 트레이너 등록 */
	@Override
	public int trainerReg(TrainingRegVO register) {
		return trDao.trainerReg(session, register);
	}

	/* 프로그램리스트 추출 */
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
	
	/* 프로그램 상세페이지  */
	@Override
	public TrainerProgramVO programDetail(int tpIndex) {
		return trDao.programDetail(session, tpIndex);
	}

	/* 결제완료 메소드 */
	@Override
	public int paymentSuccess(PaymentVO pv) {
		return trDao.paymentSuccess(session, pv);
	}
	
	/* 프로그램 남은인원 -1 */
	@Override
	public int programPersonnel(PaymentVO pv) {
		return trDao.programPersonnel(session, pv);
	}

	//트레이닝 신청 확인
	@Override
	public TrainingRegVO checkReg(String mbIndex) {
		return trDao.checkReg(session, mbIndex);
	}
	

}
