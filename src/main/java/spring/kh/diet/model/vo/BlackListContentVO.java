package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BlackListContentVO {

	private String postTitle, targetContent, cmtContent, mbNickName, targetMbNickName;
	private int postIndex;

}
