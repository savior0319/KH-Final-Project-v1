package spring.kh.diet.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class SystemAnalytics {
	
	@Around("execution(* spring.*.*.*.*.*.*(*))")
	public void test(ProceedingJoinPoint proceedingJoinPoint) {
		System.out.println("!");
	}
}
