package spring.kh.diet.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import spring.kh.diet.model.service.AdminAnalyticService;
import spring.kh.diet.model.service.AdminAnalyticServiceImpl;
import spring.kh.diet.model.vo.SystemAnalyticsDetailTotalVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;

@Controller("SystemAnalyticsController")
@Aspect
public class SystemAnalytics {

	int tHits = 0;
	int tLikes = 0;
	int tComments = 0;
	int tPost = 0; // 다이어트팁 순서대로 조회수, 좋아요, 댓글, 게시물수
	int hHits = 0;
	int hLikes = 0;
	int hComments = 0;
	int hPost = 0; // 홈트레이닝
	int cHits = 0;
	int cLikes = 0;
	int cComments = 0;
	int cPost = 0; // 게시물
	
	
	private SystemAnalyticsDetailTotalVO SADTVO;

	

	

	// @Resource(name="SystemAnalyticsController")
	// private SystemAnalyticsController sai;
	
	// 시간값가져오기
	public long returnTime() {
		long time = System.currentTimeMillis();
		return time;
	}

	@Resource(name = "adminAnalyticsService")
	private AdminAnalyticService an;

	@Pointcut("execution(* spring.kh.diet.model.service.DietTipServiceImpl.*(*)) || execution(* spring.kh.diet.model.service.HomeTrainingServiceImpl.*(*))|| execution(* spring.kh.diet.model.service.CommunityServiceImpl.*(*))|| execution(* spring.kh.diet.model.service.CommonServiceImpl.*Comment(*))")
	public void allPointcut() {

	}
	String beforserviceName = "";
	@After("allPointcut()")
	public void test(JoinPoint JP) {
		long time = this.returnTime();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String totalDay = dayTime.format(new Date(time));
		StringTokenizer tD1 = new StringTokenizer(totalDay, " ");
		String yymmdd = tD1.nextToken();
		String hhmmss = tD1.nextToken();

		StringTokenizer tD2 = new StringTokenizer(yymmdd, "-");
		String todayYear = tD2.nextToken();
		String todayMonth = tD2.nextToken();
		String todayDay = tD2.nextToken();
		
		StringTokenizer tD3 = new StringTokenizer(hhmmss, ":");
		int todayHour = Integer.parseInt(tD3.nextToken());
		int todayMinute = Integer.parseInt(tD3.nextToken());
		int todaySecond = Integer.parseInt(tD3.nextToken());
		int timeType = 0;
		
	
		String methodName = JP.getSignature().getName();
		String shortString = JP.toShortString();
		String serviceName = "";
		StringTokenizer ST1 = new StringTokenizer(shortString, ".");
		String Token1 = ST1.nextToken();
		StringTokenizer ST2 = new StringTokenizer(Token1, "(");
		ST2.nextToken();
		serviceName = ST2.nextToken();

		// Object targetName = JP.getTarget();
		// System.out.println(JP.getSignature().getDeclaringTypeName());
//		 System.out.println(targetName.toString());
		// System.out.println("서비스 : "+serviceName);
		// System.out.println("숏트링 : " + shortString);
		// System.out.println("메소드네임:" + methodName);
//		System.out.println(shortString);
		boolean timeSet = false;

		boolean oneTime = false;

		// 시간대별로 시간을 우선적으로 확인해주고, 시간의 타입에맞춰 해당값들을 계속해서 증가시킨다.
		// 디비에 갔다오면 카운트들은 초기화를 한번 해야한다.
		// 분이 딱 15분 59초 이하일경우 인설트를 시키고, 리스트에 해당 값이 있을경우는 update를해준다.
		//

		if (todayHour < 12) {
			timeType = 1;
			timeSet = true;
		}
		if (12 <= todayHour && todayHour < 15) {
			timeType = 2;
			timeSet = true;
		}
		if (15 <= todayHour && todayHour < 18) {
			timeType = 3;
			timeSet = true;
		}
		if (18 <= todayHour && todayHour < 21) {
			timeType = 4;
			timeSet = true;
		}
		if (21 <= todayHour && todayHour < 24) {
			timeType = 5;
			timeSet = true;
		}
		
//		System.out.println(timeType);
//		System.out.println(todayHour);
//		System.out.println(serviceName);
		ArrayList<TodayAnalyticsDetail> list2 = an.selectAnalytics2(timeType);
		if(!list2.isEmpty()) {
				tHits = list2.get(0).getHits();
				tLikes =list2.get(0).getLikes();
				tComments = list2.get(0).getComments();
				tPost = list2.get(0).getPost();
				// 팁
				
				hHits = list2.get(1).getHits();
				hLikes =list2.get(1).getLikes();
				hComments = list2.get(1).getComments();
				hPost = list2.get(1).getPost();
				
				cHits = list2.get(2).getHits();
				cLikes =list2.get(2).getLikes();
				cComments = list2.get(2).getComments();
				cPost = list2.get(2).getPost();
		}
			
//		System.out.println(hHits);
//		System.out.println(hLikes);
//		System.out.println(hComments);
//		System.out.println(hPost);
//		System.out.println(cHits);
//		System.out.println(cLikes);
//		System.out.println(cComments);
//		System.out.println(cPost);
//		System.out.println(serviceName);
			switch (serviceName) {
			
			case "DietTipServiceImpl":
				beforserviceName = serviceName;
//				System.out.println("목록진입 : "+beforserviceName);
//				System.out.println(methodName);
				if (methodName.equals("postHit")) // 다이어트팁 조회수
				{
					tHits++;
				}
				if (methodName.equals("boardLikeUp")) // 좋아요 증가
				{
					tLikes++;
				}
				if (methodName.equals("boardLikeDown")) // 좋아요 감소
				{
					tLikes--;
				}
				if (methodName.equals("addComment"))// 댓글 증가
				{
					tComments++;
				}
				if (methodName.equals("deleteComment")) // 댓글 감소
				{
					tComments--;
				}
				if (methodName.equals("registDietTip")) // 게시물 작성시
				{
					tPost++;
				}
				if (methodName.equals("deleteDietTip")) // 게시물 삭제시
				{
					tPost--;
				}
				timeSet = false;
				break; // 다이어트팁 게시물 조회수

			case "HomeTrainingServiceImpl":
				beforserviceName = serviceName;
				if (methodName.equals("homeTrainingHits")) // 홈트레이닝 조회수
				{
//					System.out.println("조회수");
					hHits++;
				}
				if (methodName.equals("postLikeUp")) // 좋아요 증가
				{
//					System.out.println("좋아요");
					hLikes++;
				}
				if (methodName.equals("postLikeDown"))// 좋아요감소
				{
					hLikes--;
				}
				if (methodName.equals("addComment")) // 댓글증가
				{
//					System.out.println("댓글");
					hComments++;
				}
				if (methodName.equals("deleteComment")) // 댓글감소\
				{
					hComments--;
				}
				if (methodName.equals("registHomeTraining")) // 게시물증가
				{
//					System.out.println("게시물");
					hPost++;
				}
				if (methodName.equals("deleteHomeTraining")) // 게시물감소
				{
					hPost--;
				}
				timeSet = false;
				break;

			case "CommunityServiceImpl":
				beforserviceName = serviceName;
				if (methodName.equals("postHit")) // 커뮤니티 조회수
				{
					cHits++;
				}
				if (methodName.equals("boardLikeUp")) // 커뮤니티 좋아요 증가
				{
					cLikes++;
				}
				if (methodName.equals("boardLikeDown")) // 커뮤니티 좋아요 감소
				{
					cLikes--;
				}
				if (methodName.equals("addComment")) // 댓글수 증가
				{
					cComments++;
				}
				if (methodName.equals("deleteComment")) // 댓글수 감소
				{
					cComments--;
				}
				if (methodName.equals("registCommunity")) // 게시물수 증가
				{
					cPost++;
				}
				if (methodName.equals("deletePost")) // 게시물수 감소
				{
					cPost--;
				}
				timeSet = false;
				break;
			case "CommonServiceImpl":
//				System.out.println("?");
				// System.out.println(beforserviceName);
//				System.out.println(JP.getTarget().toString());
				if (methodName.equals("addComment")) // 댓글수 증가
				{
//					System.out.println(serviceName);
//					System.out.println(beforserviceName);
					if (beforserviceName.equals("HomeTrainingServiceImpl")) {
						hComments++;
					}
					if (beforserviceName.equals("CommunityServiceImpl")) {
						cComments++;
					}
					if (beforserviceName.equals("DietTipServiceImpl")) {
						tComments++;
					}
				}
//				System.out.println(methodName);
				if (methodName.equals("deleteComment")) {
//					System.out.println("삭제");
					if (beforserviceName.equals("HomeTrainingServiceImpl")) {
						hComments--;
					}
					if (beforserviceName.equals("CommunityServiceImpl")) {
						cComments--;
					}
					if (beforserviceName.equals("DietTipServiceImpl")) {
						tComments--;
					}
				}
				break;

			}


		ArrayList<TodayAnalyticsDetail> list = an.selectAnalytics(timeType);
		if (list.isEmpty()) {
//			System.out.println("시간변경 진입");
//			System.out.println("테스트:  "+timeType);
			// 추가
			TodayAnalyticsDetail TAD = new TodayAnalyticsDetail(tHits, tLikes, tComments, tPost, timeType, 1,
					"sysdate");
			an.insertAnalytics(TAD);
			TAD.setHits(hHits);
			TAD.setLikes(hLikes);
			TAD.setComments(hComments);
			TAD.setPost(hPost);
			TAD.setListType(2);
			an.insertAnalytics(TAD);
			TAD.setHits(cHits);
			TAD.setLikes(cLikes);
			TAD.setComments(cComments);
			TAD.setPost(cPost);
			TAD.setListType(3);
			an.insertAnalytics(TAD);
		} else 
		{
			TodayAnalyticsDetail TAD = new TodayAnalyticsDetail();
			TAD.setUpdateTime("sysdate");
			TAD.setTimeType(timeType);
			if (todaySecond > 0) {
			
//						System.out.println(list.get(i).getHits());
//						System.out.println(tComments);
//						System.out.println("테스트:"+list.get(i).getHits());
//						tHits = list.get(0).getHits();
//						tComments = list.get(0).getComments();
//						tPost = list.get(0).getPost();
//						tLikes = list.get(0).getLikes();
						TAD.setHits(tHits);
						TAD.setLikes(tLikes);
						TAD.setComments(tComments);
						TAD.setPost(tPost);
						TAD.setListType(1);
						an.updateAnalytics(TAD);
//						hHits += list.get(1).getHits();
//						hComments += list.get(1).getComments();
//						hPost += list.get(1).getPost();
//						hLikes += list.get(1).getLikes();
						TAD.setHits(hHits);
						TAD.setLikes(hLikes);
						TAD.setComments(hComments);
						TAD.setPost(hPost);
						TAD.setListType(2);
						an.updateAnalytics(TAD);
//						cHits += list.get(2).getHits();
//						cComments += list.get(2).getComments();
//						cPost += list.get(2).getPost();
//						cLikes += list.get(2).getLikes();
						TAD.setHits(cHits);
						TAD.setLikes(cLikes);
						TAD.setComments(cComments);
						TAD.setPost(cPost);
						TAD.setListType(3);
						an.updateAnalytics(TAD);
				tHits = 0;
				tLikes = 0;
				tComments = 0;
				tPost = 0;
				hHits = 0;
				hLikes = 0;
				hComments = 0;
				hPost = 0;
				cHits = 0;
				cLikes = 0;
				cComments = 0;
				cPost = 0;

			}
			// 00시일경우 값을 업데이트 한번하고, 초기화
			if ((todayHour == 12 && todayMinute == 00 && todaySecond == 00)
					|| (todayHour == 15 && todayMinute == 00 && todaySecond == 00)
					|| (todayHour == 18 && todayMinute == 00 && todaySecond == 00)
					|| (todayHour == 21 && todayMinute == 00 && todaySecond == 00)
					|| (todayHour == 00 && todayMinute == 00 && todaySecond == 00)) {
//						tHits += list.get(0).getHits();
//						tComments += list.get(0).getComments();
//						tPost += list.get(0).getPost();
//						tLikes += list.get(0).getLikes();
				TAD.setHits(tHits);
				TAD.setLikes(tLikes);
				TAD.setComments(tComments);
				TAD.setPost(tPost);
				TAD.setListType(1);
						an.updateAnalytics(TAD);
//						hHits += list.get(1).getHits();
//						hComments += list.get(1).getComments();
//						hPost += list.get(1).getPost();
//						hLikes += list.get(1).getLikes();
						TAD.setHits(hHits);
						TAD.setLikes(hLikes);
						TAD.setComments(hComments);
						TAD.setPost(hPost);
						TAD.setListType(2);
						an.updateAnalytics(TAD);
//						cHits += list.get(2).getHits();
//						cComments += list.get(2).getComments();
//						cPost += list.get(2).getPost();
//						cLikes += list.get(2).getLikes();
						TAD.setHits(cHits);
						TAD.setLikes(cLikes);
						TAD.setComments(cComments);
						TAD.setPost(cPost);
						TAD.setListType(3);
						an.updateAnalytics(TAD);
				}
				tHits = 0;
				tLikes = 0;
				tComments = 0;
				tPost = 0;
				hHits = 0;
				hLikes = 0;
				hComments = 0;
				hPost = 0;
				cHits = 0;
				cLikes = 0;
				cComments = 0;
				cPost = 0;
			}
		}

}
