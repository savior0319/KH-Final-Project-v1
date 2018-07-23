package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QuestionVO {
	private int qsIndex, mbIndex;
	private String qsTitle, qsContent;
	private Timestamp qsWriteTime;
}
