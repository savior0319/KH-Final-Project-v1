package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomeTrainingVO {
	private String htMainPhoto, htVideo, htTitle, htType, htPart, htStepTime, htStepType, htStepKal, htStepHard, htExplain, htNickname;
	private int indexNo, mbIndex, htNo, htLike, htHits, htWriterNo, htCommentNo, likeYN;
	private Timestamp htEnrollDate;
}
