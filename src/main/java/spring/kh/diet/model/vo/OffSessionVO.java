package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OffSessionVO {

	private String indexNo,sessionId,sessionIp,firstOn,stay,nickName,device,lastIn;
}
