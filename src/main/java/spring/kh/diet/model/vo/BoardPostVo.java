package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardPostVo {
	private String postTitle, postContent, bcaName, postMbNickName, postImage;
	private int postIndex, brdIndex, mbIndex, postCount, postHit, postLike;
	private Timestamp postDateTime;
}
