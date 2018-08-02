package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.TrainerAreaListVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainerSearchVO;
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
		return session.insert("trainer.registTrainerProgram", tpv);
	}

	public int trainerReg(SqlSessionTemplate session, TrainingRegVO register) {
		int result = session.insert("trainer.trainerReg", register);
		System.out.println("결과아아아!" + result);
		return result;
	}

	/* 트레이너 찾기 */
	@Override
	public ArrayList<TrainingRegVO> trainerReg(SqlSessionTemplate session, TrainerSearchVO tsv) {

		String areaList = tsv.getArea();
		String[] areaSplit = areaList.split("/");
		int areaLength = areaSplit.length;

		TrainerAreaListVO tavo = new TrainerAreaListVO();

		tavo.setCity(tsv.getCity());

		if (areaLength == 1) {
			tavo.setArea1(areaSplit[0]);
			tavo.setArea2("none");
			tavo.setArea3("none");
		} else if (areaLength == 2) {
			tavo.setArea1(areaSplit[0]);
			tavo.setArea2(areaSplit[1]);
			tavo.setArea3("none");
		} else {
			tavo.setArea1(areaSplit[0]);
			tavo.setArea2(areaSplit[1]);
			tavo.setArea3(areaSplit[2]);
		}

		List<TrainingRegVO> list = session.selectList("trainer.trainerSearch", tavo);

		System.out.println(list);
		return (ArrayList<TrainingRegVO>) list;
	}

}
