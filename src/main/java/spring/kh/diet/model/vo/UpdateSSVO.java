package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UpdateSSVO {

	// 로그인시 세션 테이블의 로그인 ID값 변경하기위한 VO
	private String mbNickName,sessionIp,device;
	/*set SS_Login = #{MB_NICKNAME} and SS_FirstON = sysdate and  SS_INVALIDATE = sysdate + 30/(24*60)
			
	where ss_IP = request.getRemoteAddr()*/
	 
}
