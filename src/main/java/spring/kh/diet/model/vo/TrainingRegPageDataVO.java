package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainingRegPageDataVO {
	private ArrayList<TrainingRegVO> trList;
	private String pageNavi;
	private int start, end;
}
