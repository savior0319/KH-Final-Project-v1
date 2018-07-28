package spring.kh.diet.model.vo;



import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardPostVO {
	private String postTitle, postContent, postImage, bcaName, postNickname, mbImage;
	private int postIndex, brdIndex, mbIndex, postComCount, postHit, postLike, bcaIndex,likeYN,bookMarkYN;
	private Timestamp postDateTime;
}
