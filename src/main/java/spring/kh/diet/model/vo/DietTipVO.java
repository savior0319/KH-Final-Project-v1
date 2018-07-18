package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DietTipVO {
	private String dtTitle, dtMainPhoto, dtExplain, dtSammary;
	private int dtIndex, dtNo, dtType, dtWriterNo, dtLike, dtSee;
	private Date dtDate;
	
	
}
