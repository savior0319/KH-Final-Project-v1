package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ApplyTrainerPDVO {
	private ArrayList<TrainingRegVO> comList;
	private String pageNavi, type,trStatus;
	private int start, end, mbIndex, bcaIndex;

}
