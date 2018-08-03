package spring.kh.diet.model.vo;

import java.sql.Timestamp;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class PaymentVO {
	
	private int payIndex, tpIndex, trIndex, mbIndex, price, tpRemainingPersonnel;
	private Timestamp payTime;
}
