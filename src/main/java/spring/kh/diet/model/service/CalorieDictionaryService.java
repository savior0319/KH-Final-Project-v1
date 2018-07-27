package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.FoodCalPageDataVO;
import spring.kh.diet.model.vo.FoodCalVO;

public interface CalorieDictionaryService {

	FoodCalVO getFoodCalInfo(int fcIndex);

	FoodCalPageDataVO getFoodCalList(int currentPage);

}
