package spring.kh.diet.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardLikeVO {
	private int likeIndex, targetIndex, targetType, mbIndex, targetMbIndex;
}
