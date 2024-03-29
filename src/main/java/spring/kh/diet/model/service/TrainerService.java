package spring.kh.diet.model.service;


import java.util.ArrayList;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.PaymentVO;
import spring.kh.diet.model.vo.ProgramPageDataVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainerSearchVO;
import spring.kh.diet.model.vo.TrainingRegVO;

public interface TrainerService {


	TrainingRegVO getTrIndex(MemberVO mv);

	int registTrainerProgram(TrainerProgramVO tpv);

	int trainerReg(TrainingRegVO trv);

	ProgramPageDataVO getProgramList(int currentPage, int trIndex);

	ArrayList<TrainingRegVO> trainerSearch(TrainerSearchVO tsv);

	TrainerProgramVO programDetail(int tpIndex);

	int paymentSuccess(PaymentVO pv);

	int programPersonnel(PaymentVO pv);

	TrainingRegVO checkReg(String mbIndex);


}
