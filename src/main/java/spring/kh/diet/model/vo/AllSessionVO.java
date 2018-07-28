package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AllSessionVO {
	
	private String indexNo,sessionId,sessionIp,firstOn,invalidate,state,logInNickName,device;
	

}
