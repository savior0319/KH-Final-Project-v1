package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

public interface DietTipService {

	DietTipPDVO getDietTipList(int currentPage, DietTipPDVO pdvo);

	DietTipVO getDietTip(int index);

	int registDietTip(DietTipVO dt);

	int deleteDietTip(int indexNo);

	DietTipVO loadUpdateDietTip(int indexNo);

	int updateDietTip(DietTipVO dt);

	int postHit(int indexNo);
	
}
