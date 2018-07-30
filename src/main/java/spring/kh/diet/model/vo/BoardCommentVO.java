package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCommentVO {
	private String cmtContent, mbNickname, mbImage, postTitle,dtTitle;
	private int cmtIndex, postIndex, mbIndex, cmtLike,cmtBlame,dtIndex;
	private int postHit,postLike,bcaIndex,dtLike,dtSee,dtType;
	private Timestamp cmtDateTime;
}
