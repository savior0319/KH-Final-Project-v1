package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticePDVO {
	private ArrayList<NoticeVO> noList;
	private String pageNavi, type;
	private int start, end;
}
