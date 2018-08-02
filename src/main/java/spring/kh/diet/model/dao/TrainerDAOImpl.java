package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProgramPageDataVO;
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
		return result;
	}

	@Override
	public String getProgramListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, int trIndex) {
		ProgramPageDataVO ppdv = new ProgramPageDataVO();
		ppdv.setTrIndex(trIndex);
		int recordTotalCount = session.selectOne("trainer.getProgramNavi", ppdv);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) // 시작이 1페이지가 아니라면!
		{
			sb.append("<a class='item' href='/getProgramList.diet?trIndex=" + trIndex + "&currentPage=" + (startNavi - 1)
					+ "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/getProgramList.diet?trIndex="
								+ trIndex + "&currentPage=" + i + "'><strong>" + i + "</strong></a>");
			} else {
				sb.append("<a class='item' href='/getProgramList.diet?trIndex=" + trIndex + "&currentPage=" + i + "'> "
						+ i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/getProgramList.diet?trIndex=" + trIndex + "&currentPage=" + (endNavi + 1)
					+ "'> &gt; </a>");
		}

		return sb.toString();
	}

	@Override
	public ArrayList<TrainerProgramVO> getProgramList(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, int trIndex) {
		ProgramPageDataVO ppdv = new ProgramPageDataVO();
		ppdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		ppdv.setEnd(currentPage * recordCountPerPage);
		ppdv.setTrIndex(trIndex);

		List<TrainerProgramVO> list = session.selectList("trainer.getProgramList", ppdv);

		return (ArrayList<TrainerProgramVO>) list;
	}

	/* 트레이너 찾기 */
	@Override
	public ArrayList<TrainingRegVO> trainerSearch(SqlSessionTemplate session, TrainerSearchVO tsv) {

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

		return (ArrayList<TrainingRegVO>) list;

	}

	@Override
	public TrainerProgramVO programDetail(SqlSessionTemplate session, int tpIndex) {
		return session.selectOne("trainer.programDetail",tpIndex);
	}

}
