package spring.kh.diet.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
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
	/* 로그인 비밀번호 암호화 */ 
	@Pointcut("execution(* spring.kh.diet.model.service.*ServiceImpl.login(..))")
	public void encryptSHA256_1() {
	}
	
	/* 비밀번호 재설정 암호화  */ 
	@Pointcut("execution(int spring.kh.diet.model.service.*ServiceImpl.updatePassword(..))")
	public void encryptSHA256_2() {
	}
	
	/*마이페이지 정보 불러오기 */
	@Pointcut("execution(* spring.kh.diet.model.service.*ServiceImpl.updateMyInfo(..))")
	public void encryptSHA256_3() {
	}
	
	/*로그인 비밀번호 재설정 암호화 */
	@Pointcut("execution(* spring.kh.diet.model.service.*ServiceImpl.updateMypass(..))")
	public void encryptSHA256_4() {
	}
	
	@Before(value = "encryptSHA256()")
	public void passwordEncrypt(JoinPoint jp) throws Exception {
		MemberVO vo = (MemberVO) (jp.getArgs()[0]);
		String encryptPassword = new SHA256Hash().encryptData(vo.getMbPwd());
		vo.setMbPwd(encryptPassword);
	}

	@Before(value = "encryptSHA256_1()")
	public void passwordEncrypt1(JoinPoint jp) throws Exception {
		MemberVO vo = (MemberVO) (jp.getArgs()[0]);
		String encryptPassword = new SHA256Hash().encryptData(vo.getMbPwd());
		vo.setMbPwd(encryptPassword);
	}
	
	@Before(value = "encryptSHA256_2()")
	public void passwordEncrypt2(JoinPoint jp) throws Exception {
		MemberVO vo = (MemberVO) (jp.getArgs()[0]);
		String encryptPassword = new SHA256Hash().encryptData(vo.getMbPwd());
		vo.setMbPwd(encryptPassword);
	}
	
	@Before(value = "encryptSHA256_3()")
	public void passwordEncrypt3(JoinPoint jp) throws Exception {
		MemberVO vo = (MemberVO) (jp.getArgs()[0]);
		String encryptPassword = new SHA256Hash().encryptData(vo.getMbPwd());
		vo.setMbPwd(encryptPassword);
	}
	
	@Before(value = "encryptSHA256_4()")
	public void passwordEncrypt4(JoinPoint jp) throws Exception {
		MemberVO vo = (MemberVO) (jp.getArgs()[0]);
		String encryptPassword = new SHA256Hash().encryptData(vo.getMbPwd());
		vo.setMbPwd(encryptPassword);
	}
	
}
