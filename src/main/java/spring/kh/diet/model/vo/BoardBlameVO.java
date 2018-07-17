package spring.kh.diet.model.vo;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardBlameVO {
	private String targetContents;
	private int blaIndex, targetIndex, targetType, userIndex, targetMBIndex;
	private Timestamp blaDateTime;
}
