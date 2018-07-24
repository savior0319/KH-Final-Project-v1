package spring.kh.diet.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class MyPostAndComment {
	
	private String postTitle, postContent, postImage, postNickname, mbImage;
	private int postIndex,mbIndex;
	private Date postDateTime;
	
	private String cmtContent, mbNickname ;
	private int cmtIndex, cmtLike, cmtBlame;
	private Timestamp cmtDateTime;
	
	private int bmkIndex,postHit;
}
