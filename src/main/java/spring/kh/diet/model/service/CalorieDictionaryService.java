package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.FoodCalPageDataVO;
import spring.kh.diet.model.vo.FoodCalVO;
import spring.kh.diet.model.vo.HealthCalPageDataVO;
import spring.kh.diet.model.vo.HealthCalVO;

public interface CalorieDictionaryService {

	FoodCalVO getFoodCalInfo(int fcIndex);

	FoodCalPageDataVO getFoodCalList(int currentPage, String searchText);

	HealthCalPageDataVO getHealthCalList(int currentPage, String searchText);

	HealthCalVO getHealthCalInfo(int hcIndex);

}
