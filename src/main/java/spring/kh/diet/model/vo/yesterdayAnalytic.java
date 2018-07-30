package spring.kh.diet.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class yesterdayAnalytic {

	private String bdIndex,type,bdToday;
	private int dtHits,htHits,brHits,dtComments,htComments,brComments,dtBoard,htBoard,brBoard,dtLike,htLike,brLike;
	
}
