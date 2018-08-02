package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerProgramMemberVO {
	private int tpIndex, trIndex, mbIndex, tpCost, tpPersonnel;
	private String tpTrainType, tpTitle, tpMainImage, tpActiveDay, tpLocation, tpContent, mbId, mbName, mbNickName;
	private String[] tpActiveDays;
	private Date tpActiveStart, tpActiveEnd;
	private Timestamp tpRegDate;

}
