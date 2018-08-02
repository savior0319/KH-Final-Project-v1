package spring.kh.diet.common;

import org.apache.log4j.ConsoleAppender;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Controller;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class Log4jCommon {

	/*private Logger logger;
	private ProceedingJoinPoint pjp;
	private Signature sig = pjp.getSignature();
	
	@Pointcut("execution(* spring.kh.diet.model.service.DietTipServiceImpl.*(*)) || execution(* spring.kh.diet.model.service.HomeTrainingServiceImpl.*(*))|| execution(* spring.kh.diet.model.service.CommunityServiceImpl.*(*))")
	public void testMethod() {
		
	} 
	
	@Around("testMethod()")
	public void testMain(ProceedingJoinPoint pjp) throws Throwable {
		
	
		log.debug("디버그  :  단계 테스트");
		log.info("인포 :  단계 테스트");
		log.trace("트레이스 :  단계 테스트");
		logger.debug("debug :  단계 테스트");
		logger.info("info :  단계 테스트");
		logger.trace("Trace  :  단계 테스트");
		logger.error("error :  :  단계 테스트");
		logger.fatal("fatal :  단계 테스트");
		System.out.println("테스트");
		
		
		// 시행전
		Object returnObj = pjp.proceed();
		// 시행후
		System.out.println("어라운드");
//		System.out.println(sig.getName());
//		System.out.println(sig.toLongString());
//		System.out.println(sig.toShortString());
	}*/
}
