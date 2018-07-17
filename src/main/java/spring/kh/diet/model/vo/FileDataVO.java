package spring.kh.diet.model.vo;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FileDataVO {
	private String beforeFileName,afterFileName,filePath,fileUser;
	private long fileSize;
	private Timestamp uploadTime;
}
