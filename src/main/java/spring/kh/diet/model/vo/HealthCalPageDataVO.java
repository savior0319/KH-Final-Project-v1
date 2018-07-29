package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthCalPageDataVO {
	private ArrayList<HealthCalVO> hcList;
	private String pageNavi, searchText;
	private int start, end;
}
