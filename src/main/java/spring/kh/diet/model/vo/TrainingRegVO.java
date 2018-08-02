package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainingRegVO {
	private String trName, trAddress, trPhone, trGender, trCity, trImagePath, trContent, trArea, mbId, mbName, mbNickName,mbGrade,trStatus; // mbGrade,trStatus 혜윤 추가 
	private int trIndex, mbIndex, trHeight, trWeight;
	private Timestamp trRegDate;
	private Date trBirth;
}
