package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllSessionListPDVO {


	private ArrayList<AllSessionVO> ssList;
	private String pageNavi, type;
	private int start, end;


}
