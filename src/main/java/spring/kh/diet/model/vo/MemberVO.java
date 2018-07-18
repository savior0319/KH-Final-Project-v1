package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberVO {
	private int mbAge,mbIndex;
	private String mbId,mbPwd,mbName,mbNickName,mbGender,
				   mbImage,mbPromise,mbPhone,mbAddress,mbHobby,
				   mbInterest,mbState,mbGrade,mbAdAgree,mbHeight,
				   mbWeight;
	private Date mbEnrollDate;

}
	