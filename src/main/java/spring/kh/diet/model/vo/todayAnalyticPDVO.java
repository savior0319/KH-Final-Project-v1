package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class todayAnalyticPDVO {
	private String type;
	private todayHitsVO tHVO;
	private todayCommentsVO tCVO;
	private todayPostVO tPVO;
	private todayLikeVO tLVO;
	private ArrayList<MemberVO> MVO;
	private ArrayList<DelMemberVO> DMVO;
	private ArrayList<AllSessionVO> ASVO;
	private ArrayList<OnSessionVO> OSVO;
}
