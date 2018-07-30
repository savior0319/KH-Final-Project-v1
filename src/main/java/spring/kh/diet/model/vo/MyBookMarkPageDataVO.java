package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyBookMarkPageDataVO {

	private ArrayList<BoardBookMarkVO> comList;
	private String pageNavi, type;
	private int start, end, mbIndex,bcaIndex;

}
