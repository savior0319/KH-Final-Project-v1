package spring.kh.diet.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SystemAnalyticsDetailTotalVO {

	private int tHits,tLike,tComments,tPost,hHits,hLike,hComments,hPost,cHits,cLike,cComments,cPost,timeType;
	

}
