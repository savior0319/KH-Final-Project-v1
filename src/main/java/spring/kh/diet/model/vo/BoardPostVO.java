package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardPostVO {
	private String postTitle, postContent, bcaName, postMbNickName, postImage, mbImage;
	private int postIndex, brdIndex, mbIndex, postComCount, postHit, postLike;
	private Timestamp postDateTime;
}
