package vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class InteractionVO {
	int pno;
	String user_id;
	boolean like_status;
	boolean dislike_status;
	boolean view_status;
	boolean comment_status;
	Timestamp interacted_at;
}
