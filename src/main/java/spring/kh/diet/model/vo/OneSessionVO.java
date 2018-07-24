package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OneSessionVO {
	private String indexNo, sessionId, sessionIp, firstOn, invalidate, state, loginId, device;	
	
}
