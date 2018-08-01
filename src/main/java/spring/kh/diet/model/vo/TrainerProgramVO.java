package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerProgramVO {

	private int tpIndex, mbIndex, trIndex, tpCost;
	private String tpName, tpAge, tpPhone, tpGender, tpTrainType, tpActiveTime, tpLocation, tpContent;
	private Date tpRegDate;

}
