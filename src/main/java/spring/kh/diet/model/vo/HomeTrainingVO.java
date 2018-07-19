package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomeTrainingVO {
	private String htMainVideo, htTitle, htPart, htVideoMinute, htLevel, htCalories, htExplain;
	private int htIndex, htNo, htLike, htHits;
	private Date htDate;
}
