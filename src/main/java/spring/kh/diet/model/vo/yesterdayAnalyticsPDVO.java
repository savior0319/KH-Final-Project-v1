package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class yesterdayAnalyticsPDVO {
	private String type;
	private todayHitsVO tHVO;
	private todayCommentsVO tCVO;
	private todayPostVO tPVO;
	private todayLikeVO tLVO;
}
