package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FoodCalVO {
	private String fcName;
	private int fcIndex, fcGram, fcCal, fcTan, fcDan, fcFat, fcSugar, fcNat;
}
