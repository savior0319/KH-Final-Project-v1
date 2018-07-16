package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberVO {
	private int memberIndex,age;
	private String memberId,memberPwd,memberName,nickName,
	promise,email,phone,address,hobby,interest,memberState,
	memberGrade,adAgree;
}
