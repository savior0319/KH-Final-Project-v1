package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;

public interface HomeTrainingService {
	
	HomeTrainingPageDataVO homeTrainingList(int currentPage, String type);

	HomeTrainingVO homeTraining(int index);
}
