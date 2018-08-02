package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProgramPageDataVO {
	private ArrayList<TrainerProgramVO> proList;
	private int trIndex;
	private String pageNavi;
	private int start, end;
}
