package spring.kh.diet.common;

import java.security.MessageDigest;

public class SHA256Hash {

	public String encryptData(String data) throws Exception {
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.update(data.getBytes());
		byte[] msgStr = mDigest.digest();
		StringBuffer sBuffer = new StringBuffer();

		for (int i = 0; i < msgStr.length; i++) {
			byte tmpStrByte = msgStr[i];
			String tmpEncText = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);
			sBuffer.append(tmpEncText);
		}
		return sBuffer.toString();
	}
}
