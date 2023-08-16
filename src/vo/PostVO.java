package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	private int pno;
	private String userId;
	private String title;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String content;
	private String nickname;
	private String grade;
	private int viewCount;
	private int commentCount;
	private int likeCount;
	private int dislikeCount;
	private int vno;
	private Boolean blocked;
	private String videoTitle;
}
