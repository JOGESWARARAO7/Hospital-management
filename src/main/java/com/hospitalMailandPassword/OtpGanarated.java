package com.hospitalMailandPassword;

import java.util.Random;

public class OtpGanarated {

	public static String getotp() {
		Random random = new Random();
        int otp = 100000 + random.nextInt(900000); // Generate a 6-digit OTP
        return String.valueOf(otp);
	}

}
