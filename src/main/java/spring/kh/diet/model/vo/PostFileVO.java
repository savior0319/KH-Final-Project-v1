package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostFileVO {
	private String pfiOriginName, pfiFileName, pfiPath;
	private int pfiIndex, postIndex, mbIndex, pfiFileSize;
	private Timestamp pfiDateTime;
}
