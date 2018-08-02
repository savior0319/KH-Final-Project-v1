package spring.kh.diet.model.service;


import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProgramPageDataVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainingRegVO;

public interface TrainerService {


	TrainingRegVO getTrIndex(MemberVO mv);

	int registTrainerProgram(TrainerProgramVO tpv);

	int trainerReg(TrainingRegVO trv);

	ProgramPageDataVO getProgramList(int currentPage, int trIndex);


}
