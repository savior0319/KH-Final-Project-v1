package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyCommentPageDataVO {

	private ArrayList<BoardCommentVO> comList;
	private String pageNavi, type;
	private int start, end, mbIndex;

}
