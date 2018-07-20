package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyActivityVO {
	private int mbIndex, myAttendance, myCommentCount, myBoardCount;
	private Date mbEnrollDate;
}
