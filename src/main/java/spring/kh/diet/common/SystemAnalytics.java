package spring.kh.diet.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class SystemAnalytics {
	
	@Pointcut("execution (* spring.kh.diet.*.*.*Impl.*(*))")
	public void allPointcut() {}
	
	@Before("allPointcut()")
	public void test(JoinPoint JP){
				
		String methodName = JP.getSignature().getName();
		String shortString = JP.toShortString();
//		System.out.println(shortString);
//		System.out.println(methodName);
		switch(shortString) 
		{
		case "DietTipServiceImpl" : 
			if(methodName.equals("postHit")) // 다이어트팁 조회수
			{
//				System.out.println("출력출력");
			}
			break; // 다이어트팁 게시물 조회수
			
			
		case "HomeTrainingServiceImpl" : 
			if(methodName.equals("homeTrainingHits")) // 홈트레이닝 조회수
			break;
			
			// 홈트레이닝  게시물 조회수
		
		}
//		if(methodName.equals("postHit")) {System.out.println("1");}
		
//		System.out.println(JP.getSignature().getName());
//		System.out.println(JP.toString());
//		Obejct[] args = JP.getArgs();
	}
}
