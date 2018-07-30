package spring.kh.diet.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthCalVO {
	private String hcName, hcType, hcHard, hcSet, hcCal, hcExplain, hcVideo;
	private int hcIndex;
}
