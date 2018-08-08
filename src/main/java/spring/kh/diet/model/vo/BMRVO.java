package spring.kh.diet.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BMRVO {

	private String gender, age, height, weight, period, periodUnit, activeMass, bmr, needCal, goalWeight;

}
