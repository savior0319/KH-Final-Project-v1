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
	private String mbId, mbPwd, mbName, mbNickName, mbGender, mbPromise, mbPhone, mbAddress, mbInterest,
			mbGrade, mbBmi, mbReport;
	private String mbImage;
	private Date mbEnrollDate;

}
