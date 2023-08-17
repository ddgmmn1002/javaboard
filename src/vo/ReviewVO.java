package vo;

import lombok.Data;

@Data
public class ReviewVO {
	private int rno;
	private int vno;
	private String userId;
	private int likeStatus;
	private int dislikeStatus;
}
