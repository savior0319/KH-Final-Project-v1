package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DietTipPageDataVO {
	private ArrayList<DietTipVO> dtList;
	private String pageNavi, type;
	private int start, end;
	
}
