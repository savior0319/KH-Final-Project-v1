package spring.kh.diet.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Controller;



@Controller
@Aspect
public class Log4jCommon {
	long time = System.currentTimeMillis();
	SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String totalDay = dayTime.format(new Date(time));

/*	// 서비스용 After
	@Pointcut("execution(* spring.kh.diet.model.service.DietTipServiceImpl.*(*)) || execution(* spring.kh.diet.model.service.HomeTrainingServiceImpl.*(*))|| execution(* spring.kh.diet.model.service.CommunityServiceImpl.*(*))")
	public void afterPointCut() {
		
	} */
	// 컨트롤러용 Before
	@Pointcut("execution(* spring.kh.diet.controller.DietTipControllerImpl.*(*)) || execution(* spring.kh.diet.controller.HomeTrainingControllerImpl.*(*))|| execution(* spring.kh.diet.controller.CommunityControllerImpl.*(*))"
			+ "|| execution(* spring.kh.diet.model.service.DietTipServiceImpl.*(*)) || execution(* spring.kh.diet.model.service.HomeTrainingServiceImpl.*(*))|| execution(* spring.kh.diet.model.service.CommunityServiceImpl.*(*))"
			+ "|| execution(* spring.kh.diet.model.dao.DietTipDAOImpl.*(*)) || execution(* spring.kh.diet.model.dao.HomeTrainingDAOImpl.*(*))|| execution(* spring.kh.diet.model.dao.CommunityDAOImpl.*(*))")
	public void beforePointCut() {
		
	} 
	
	// 컨트롤러 쪽 포인트컷, Before
	@Before("beforePointCut()")
	public void logBeforeController(JoinPoint JP){

		String methodName = JP.getSignature().getName();
		String shortString = JP.toShortString();
		String serviceName = "";
		StringTokenizer ST1 = new StringTokenizer(shortString, ".");
		String Token1 = ST1.nextToken();
		StringTokenizer ST2 = new StringTokenizer(Token1, "(");
		ST2.nextToken();
		serviceName = ST2.nextToken();
//		System.out.println(totalDay);
//		System.out.println("컨트롤러 @ 메소트명 : "+methodName);
//		System.out.println("컨트롤러 @ 서비스명 : "+serviceName);
//		System.out.println("컨트롤러 @ 투스트링 : "+JP.toString());
		// JP.tostring 
		// execution(ArrayList spring.kh.diet.model.service.DietTipServiceImpl.getNextPreDt(int))
		
		
//		System.out.println("컨트롤러 @ 시그니처 겟네임 : "+JP.getSignature().getName());
		// checkBoardBookMark
//		System.out.println("컨트롤러 @ 시그니처 몰라 : "+JP.getSignature().getDeclaringTypeName());
		//spring.kh.diet.model.service.CommunityServiceImpl
		
//		System.out.println("컨트롤러 @ 타겟 클래스 : "+JP.getTarget().getClass());
		//class spring.kh.diet.model.service.DietTipServiceImpl
		
		


	        
	}
	
//	@Before("testMethod()")
//	public void testMain2(JoinPoint JP){
//		System.out.println("ㅇ,아아아아");
//	}
	
	// 서비스 쪽 포인트컷, After
	/*@AfterReturning("afterPointCut()")
	public void logAfterService(JoinPoint JP) {
		String methodName = JP.getSignature().getName();
		String shortString = JP.toShortString();
		String serviceName = "";
		StringTokenizer ST1 = new StringTokenizer(shortString, ".");
		String Token1 = ST1.nextToken();
		StringTokenizer ST2 = new StringTokenizer(Token1, "(");
		ST2.nextToken();
		serviceName = ST2.nextToken();
//		System.out.println(totalDay);
		System.out.println("서비스 @ 메소트명 : "+methodName);
		System.out.println("서비스 @ 서비스명 : "+serviceName);
		System.out.println("서비스 @ 투스트링 : "+JP.toString());
		// JP.tostring 
		// execution(ArrayList spring.kh.diet.model.service.DietTipServiceImpl.getNextPreDt(int))
		
		
		System.out.println("서비스 @ 시그니처 겟네임 : "+JP.getSignature().getName());
		// checkBoardBookMark
		System.out.println("서비스 @ 시그니처 몰라 : "+JP.getSignature().getDeclaringTypeName());
		//spring.kh.diet.model.service.CommunityServiceImpl
		
		System.out.println("서비스 @ 타겟 클래스 : "+JP.getTarget().getClass());
		//class spring.kh.diet.model.service.DietTipServiceImpl
	}
	*/
	

}
