package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCommentVO {
	private String cmtContent, mbNickname, mbImage, postTitle,dtTitle,htTitle;
	private int cmtIndex, postIndex, mbIndex, cmtLike,cmtBlame,dtIndex,indexNo;
	private int postHit,postLike,bcaIndex,dtLike,dtSee,dtType;
	private Timestamp cmtDateTime;
}
