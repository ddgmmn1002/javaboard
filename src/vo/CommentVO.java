package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	private int cno;
	private String image;
	private int pno;
	private String title;
	private String user_id;
	private String content;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String nickname;
}
