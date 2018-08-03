package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrainerProgramVO {
	private int tpIndex, trIndex, mbIndex, tpCost, tpPersonnel, tpRemainingPersonnel;
	private String tpTrainType, tpTitle, tpMainImage, tpActiveDay, tpLocation, tpContent;
	private String[] tpActiveDays;
	private Date tpActiveStart, tpActiveEnd;
	private Timestamp tpRegDate;
}
