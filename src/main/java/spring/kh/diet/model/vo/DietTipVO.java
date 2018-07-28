package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DietTipVO {
	private String dtTitle, dtMainPhoto, dtExplain, dtSammary, dtNickname;
	private int dtIndex, dtNo, dtType, dtWriterNo, dtLike, dtSee, dtCmtNo, likeYN, bookMarkYN;
	private Timestamp dtDate;
	
	
}
