package spring.kh.diet.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.vo.MemberVO;

@Service
@Aspect
public class PasswordToSHA256Advice {

	public PasswordToSHA256Advice() {
	}

	@Pointcut("execution(int spring.kh.diet.model.service.*ServiceImpl.signupsave(..))")
	public void encryptSHA256() {
	}

	@Before(value = "encryptSHA256()")
	public void passwordEncrypt(JoinPoint jp) throws Exception {
		MemberVO vo = (MemberVO) (jp.getArgs()[0]);
		String encryptPassword = new SHA256Hash().encryptData(vo.getMbPwd());
		vo.setMbPwd(encryptPassword);
	}
}
