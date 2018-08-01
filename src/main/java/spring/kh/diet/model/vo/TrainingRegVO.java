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
	private String trComment,trName, trAddress, trPhone, trGender, trCity, trImagePath, trContent, trArea;
	private int trIndex, mbIndex, trHeight, trWeight;
	private Timestamp trRegDate;
	private Date trBirth;
}
