package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

public interface DietTipService {

	DietTipPDVO getDietTipList(int currentPage, String type);

	DietTipVO getDietTip(int index);

	int registDietTip(DietTipVO dt);
	
}
