package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomeTrainingVO {
	private String htMainVideo, htTitle, htType, htPart, htVideoMinute, htLevel, htCalories, htExplain, htNickname;
	private int htIndex, htNo, htLike, htHits, htWriterNo, htCommentNumber;
	private Timestamp htDate;
}
