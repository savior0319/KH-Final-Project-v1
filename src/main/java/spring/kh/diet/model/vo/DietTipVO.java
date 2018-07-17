package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import oracle.sql.TIMESTAMP;

@Data
@AllArgsConstructor
public class DietTipVO {
	private String indexNo, dtTitle, dtMainPhoto, dtExplain;
	private int dtNo, dtType, dtWriterNo, dtHits, dtSee;
	private TIMESTAMP dtDate;
	
	
}
