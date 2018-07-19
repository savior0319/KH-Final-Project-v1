package spring.kh.diet.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FoodCalorieVO {
	private String fcName, fcUnit, fcCalories, fcCarbohydrate, fcProtein, fcFat, fcSugars, fcSodium;
	private int fcNo, fcWalk, fcRun, fcJumprope, fcSwim, fcBick;
}
