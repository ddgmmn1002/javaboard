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
	private Date birthDate;
	private String phone;
	private String email;
	private String gender;
	private Date signupDate;
	private String nickname;
	private String grade;
}
