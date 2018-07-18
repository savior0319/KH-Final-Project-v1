package spring.kh.diet.model.service;

import java.util.List;

import spring.kh.diet.model.vo.BoardPostVO;

public interface CommunityService {

	List allCommunityList();

	int registCommunity(BoardPostVO bpv);

}
