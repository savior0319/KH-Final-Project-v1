package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.HealthCenterPageDataVO;

public interface MainService {

	HealthCenterPageDataVO getHealthCenterList(int currentPage);

}
