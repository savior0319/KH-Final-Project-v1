package spring.kh.diet.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TodayAnalyticsDetail {

	private int hits,like,comments,post,timeType,listType;
	private String updateTime;
	
}
