package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class HomeTrainingLikeVO {
	private int likeIndex, targetIndex, targetType, mbIndex, targetMbIndex;
}
