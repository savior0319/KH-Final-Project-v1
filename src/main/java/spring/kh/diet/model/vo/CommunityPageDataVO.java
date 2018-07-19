package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommunityPageDataVO {
	private ArrayList<BoardPostVO> comList;
	private String pageNavi, type;
	private int start, end;
	
}
