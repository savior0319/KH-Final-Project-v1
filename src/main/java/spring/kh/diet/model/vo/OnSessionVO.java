package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OnSessionVO {

	private String indexNo, sessionId, sessionIp,state, loginId, device;
}
	