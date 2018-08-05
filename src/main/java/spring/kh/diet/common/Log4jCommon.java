package spring.kh.diet.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
@Aspect
public class Log4jCommon {
	


	long time = System.currentTimeMillis();
	private SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private String totalDay = dayTime.format(new Date(time));
	private HttpServletRequest request;
/*	// 서비스용 After
	@Pointcut("execution(* spring.kh.diet.model.service.DietTipServiceImpl.*(*)) || execution(* spring.kh.diet.model.service.HomeTrainingServiceImpl.*(*))|| execution(* spring.kh.diet.model.service.CommunityServiceImpl.*(*))")
	public void afterPointCut() {
		
	} */
	// 컨트롤러용 after
	@Pointcut("execution(* spring.kh.diet.controller.*Impl.*(*))")
	public void afterPointCut() {
	} 
	
	// 컨트롤러 쪽 포인트컷, after
	@AfterReturning("afterPointCut()")
	public void logAfterController(JoinPoint JP) throws Throwable {
		String methodName = JP.getSignature().getName();
		String shortString = JP.toShortString();
		String serviceName = "";
		StringTokenizer ST1 = new StringTokenizer(shortString, ".");
		String Token1 = ST1.nextToken();
		StringTokenizer ST2 = new StringTokenizer(Token1, "(");
		ST2.nextToken();
		serviceName = ST2.nextToken();
		
		
		// 테스트
		// 디버그 콘솔
//		log.debug("AOP 디버그 : "+methodName);
//		log.debug("AOP 디버그 : "+serviceName);
//		log.debug("AOP 디버그 : "+JP.toString());
		
		// info 콘솔
		log.info("AOP info : "+methodName);
		log.info("AOP info : "+serviceName);
		log.info("AOP info : "+JP.toString());
		
		// WARN 콘솔
		log.info("AOP info : "+methodName);
		log.info("AOP info : "+serviceName);
		log.info("AOP info : "+JP.toString());
		
		// ERROR 콘솔
		log.info("AOP info : "+methodName);
		log.info("AOP info : "+serviceName);
		log.info("AOP info : "+JP.toString());
		
		// FATAL 콘솔
		log.info("AOP info : "+methodName);
		log.info("AOP info : "+serviceName);
		log.info("AOP info : "+JP.toString());

		// 전체 로직을 생각해보자.
		// 1. 디버그단계는 디버그 콘솔로 계속 출력한다.(개발단계, 개발단계가 종료되면 info단계)
		// 2. info단계로 찍고나니
		
		
//	      File file  = new File("C:\\log4j\\Sample.txt");
//
//	      PrintStream printStream = new PrintStream(new FileOutputStream(file));
//
//	      System.setOut(printStream);  



		
//		
//		 BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
//
//		    BufferedWriter out = new BufferedWriter(new FileWriter("C:\\log4j\\Sample.txt"));
//		    try {
//		        String inputLine = null;
//		        do {
//		            inputLine=in.readLine();
//		            out.write(inputLine);
//		            out.newLine();
//		        } while (!inputLine.equalsIgnoreCase("eof"));
//		        System.out.print("Write Successful");
//		    } catch(IOException e1) {
//		        System.out.println("Error during reading/writing");
//		    } finally {
//		        out.close();
//		        in.close();
//		    }
         
        
/*		
		 //파일 객체 생성
        File file = new File("C:\\log4j\\Sample.txt");
        
        //쓰기 스트림
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
        if(file.isFile() && file.canWrite()){
            //쓰기
            bufferedWriter.write(log.info());
            //개행문자쓰기
            bufferedWriter.newLine();
            
            bufferedWriter.close();
        }*/
        
//        //입력 스트림 생성
//        FileReader filereader = new FileReader(file);
//        //입력 버퍼 생성
//        BufferedReader bufReader = new BufferedReader(filereader);
//        String line = "";
//        while((line = bufReader.readLine()) != null){
//            System.out.println(line);
//        }
//        //.readLine()은 끝에 개행문자를 읽지 않는다.            
//        bufReader.close();
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
