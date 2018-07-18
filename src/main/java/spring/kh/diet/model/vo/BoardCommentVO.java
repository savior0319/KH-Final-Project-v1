package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardCommentVO {
	private String cmtMbNickName, cmtContent, mbImage;
	private int cmtIndex, postIndex, mbIndex, cmtLike, cmtBlame;
	private Timestamp cmtDateTime;
}
