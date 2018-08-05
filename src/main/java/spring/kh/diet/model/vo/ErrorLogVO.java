package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ErrorLogVO {

	
	private String erType,erInfoOne,erInfoTwo,erInfoThr,erInfoFor,type;
	private Date erDate;
	private Timestamp erStamp;
	private int low,mid,high,ch;
	
	
}
