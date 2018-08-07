package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginLogVO {

	private String ip,id,nickName,device,search,findType;
	private Timestamp login,logout;
	private int stay,type,count,userNo;
	private Date day;
}
