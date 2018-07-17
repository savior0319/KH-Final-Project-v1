package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.DietTipPageDataVO;

public interface DietTipService {

	DietTipPageDataVO getDietTipList(int currentPage);
	
}
