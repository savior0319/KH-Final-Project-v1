package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainerSearchVO;
import spring.kh.diet.model.vo.TrainingRegVO;

public interface TrainerDAO {

	TrainingRegVO getTrIndex(SqlSessionTemplate session, MemberVO mv);

	int registTrainerProgram(SqlSessionTemplate session, TrainerProgramVO tpv);

	int trainerReg(SqlSessionTemplate session, TrainingRegVO register);

	String getProgramListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, int trIndex);

	ArrayList<TrainerProgramVO> getProgramList(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int trIndex);

	ArrayList<TrainingRegVO> trainerSearch(SqlSessionTemplate session, TrainerSearchVO tsv);


}
