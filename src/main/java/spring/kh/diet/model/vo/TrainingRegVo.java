package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainingRegVo {
	private String trName, trAddress, trPhone, trDay, trCity, trArea, trTrainType, trImagePath, trComment;
	private int trIndex, mbIndex, trHeight, trWeight;
	private Timestamp trRegDate;
	private Date trBirth;
}
