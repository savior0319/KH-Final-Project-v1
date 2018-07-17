package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class DietTipPageDataVO {
	private ArrayList<DietTipVO> dtList;
	private String pageNavi;
	private int start, end;
	
	public DietTipPageDataVO() {};
}
