package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	private String id;
	private String pw;
	private String name;
	private Date birth_date;
	private String country;
	private String phone;
	private String email;
	private String gender;
	private Date signup_date;
	private String nickname;
	private String grade;
}
