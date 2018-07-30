package spring.kh.diet.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardBookMarkVO {
	private int bmkIndex, dtIndex,mbIndex, postIndex, postHit, postLike,bcaIndex,dtLike,dtSee,dtType;
	private String postTitle, mbId,dtTitle, dtSammary;
	private Date dtDate,postDateTime;
}
