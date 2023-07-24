package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	private int cno;
	private String image;
	private int pno;
	private String title;
	private String userId;
	private String content;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private String nickname;
}
