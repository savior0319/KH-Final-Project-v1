package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberVO {
	private int mbAge, mbIndex, mbHeight, mbWeight;
	private String mbId, mbPwd, mbName, mbNickName, mbGender, mbImage, mbPromise, mbPhone, mbAddress, mbInterest,
			mbGrade;
	private Date mbEnrollDate;

}
