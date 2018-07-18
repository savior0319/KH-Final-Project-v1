package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.DietTipPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;

public interface DietTipService {

	DietTipPageDataVO getDietTipList(int currentPage, String type);

	DietTipVO getDietTip(int index);
	
}
