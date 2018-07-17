package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HealthCenterVO {
	private String hcLoaction, hcAddress, hcPhone, hcLatitude, hcLongitude, hcType;
}
