package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DietTipPDVO {
	private ArrayList<DietTipVO> dtList;
	private String pageNavi, type, searchText, category, postSort;
	private int start, end;
	
}
