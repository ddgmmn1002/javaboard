package vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
	String id;
	String pw;
	String name;
	Date birth_date;
	String country;
	String phone;
	String email;
	String gender;
	Date signup_date;
	String nickname;
	String grade;
}
