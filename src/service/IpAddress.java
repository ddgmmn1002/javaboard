package service;

import javax.servlet.http.HttpServletRequest;

public class IpAddress {
	public static String getAddress(HttpServletRequest request) {
		String addr = request.getHeader("X-Forwarded-For");
		
		if (addr == null) {
			addr = request.getRemoteAddr();
		}
		
		return addr;
	}
}
