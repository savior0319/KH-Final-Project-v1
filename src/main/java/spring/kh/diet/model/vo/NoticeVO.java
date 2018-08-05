package spring.kh.diet.model.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
	private String noticeTitle, noticeContent, noticeWriter, noticeType;
	private int noticeIndex, noticeView;
	private Timestamp noticeWriteDay;
}
