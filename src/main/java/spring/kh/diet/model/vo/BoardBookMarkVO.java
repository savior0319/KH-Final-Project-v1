package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardBookMarkVO {
	private int bmkIndex, mbIndex, postIndex, postHit, postLike,bcaIndex;
	private String postTitle, mbId;
}
