package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PostVO {
	private int pno;
	private String writer;
	private String title;
	private Timestamp created_at;
	private Timestamp updated_ap;
	private String content;
	private String nickname;
	private String grade;
	private int viewCount;
	private int commentCount;
	private int likeCount;
	private int dislikeCount;
}
