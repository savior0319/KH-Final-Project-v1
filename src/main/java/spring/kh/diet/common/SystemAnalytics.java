package spring.kh.diet.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.vo.TodayAnalyticsDetail;

@Service
@Aspect
public class SystemAnalytics {

	int tHits = 0;
	int tLike = 0;
	int tComments = 0;
	int tPost = 0; // 다이어트팁 순서대로 조회수, 좋아요, 댓글, 게시물수
	int hHits = 0;
	int hLike = 0;
	int hComments = 0;
	int hPost = 0; // 홈트레이닝
	int cHits = 0;
	int cLike = 0;
	int cComments = 0;
	int cPost = 0; // 게시물

	SystemAnalyticsInsert sai = new SystemAnalyticsInsert();

	@Pointcut("execution (* spring.kh.diet.*.*.*Impl.*(*))")
	public void allPointcut() {
	}

	@Before("allPointcut()")
	public void test(JoinPoint JP) {

		String methodName = JP.getSignature().getName();
		String shortString = JP.toShortString();
		String serviceName = "";
		StringTokenizer ST1 = new StringTokenizer(shortString, ".");
		String Token1 = ST1.nextToken();
		StringTokenizer ST2 = new StringTokenizer(Token1, "(");
		ST2.nextToken();
		serviceName = ST2.nextToken();

		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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

//		System.out.println("숏트링 : " + shortString);
//		System.out.println("메소드네임:" + methodName);
		boolean timeSet = false;
		int timeType = 0;
		boolean oneTime = false;

		// 시간대별로 시간을 우선적으로 확인해주고, 시간의 타입에맞춰 해당값들을 계속해서 증가시킨다.
		// 디비에 갔다오면 카운트들은 초기화를 한번 해야한다.
		// 분이 딱 15분 59초 이하일경우 인설트를 시키고, 리스트에 해당 값이 있을경우는 update를해준다.
		//

		if (todayHour <= 12) {
			timeType = 1;
			timeSet = true;
		}
		if (12 < todayHour && todayHour <= 15) {
			timeType = 2;
			timeSet = true;
		}
		if (15 < todayHour && todayHour <= 18) {
			timeType = 3;
			timeSet = true;
		}
		if (18 < todayHour && todayHour <= 21) {
			timeType = 4;
			timeSet = true;
		}
		if (21 < todayHour && todayHour <= 24) {
			timeType = 5;
			timeSet = true;
		}

		if (timeSet) {
			switch (serviceName) {
			case "DietTipServiceImpl":
				if (methodName.equals("postHit")) // 다이어트팁 조회수
				{
					tHits++;
				}
				if (methodName.equals("boardLikeUp")) // 좋아요 증가
				{
					tLike++;
				}
				if (methodName.equals("boardLikeDown")) // 좋아요 감소
				{
					tLike--;
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
				if (methodName.equals("homeTrainingHits")) // 홈트레이닝 조회수
				{
					hHits++;
				}
				if (methodName.equals("postLikeUp")) // 좋아요 증가
				{
					hLike++;
				}
				if (methodName.equals("postLikeDown"))// 좋아요감소
				{
					hLike--;
				}
				if (methodName.equals("addComment")) // 댓글증가
				{
					hComments++;
				}
				if (methodName.equals("deleteComment")) // 댓글감소\
				{
					hComments--;
				}
				if (methodName.equals("registHomeTraining")) // 게시물증가
				{
					hPost++;
				}
				if (methodName.equals("deleteHomeTraining")) // 게시물감소
				{
					hPost--;
				}
				timeSet = false;
				break;

			case "CommunityServiceImpl":
				if (methodName.equals("postHit")) // 커뮤니티 조회수
				{
//					System.out.println("조회수증가 // 커뮤니티");
				}
				timeSet = false;
				break;
			}
		}

		// 15분단위로 값들을 인서트 || 업데이트
		// DB에 전체 값들, 넣은시간(업데이트시간), 시간의 타입(분류 1~5), 게시물의 분류(1~3?)
		// 한번에 동작하는 쿼리는 3개
		// 디비에 들어가는 값들은 hits, like, comments, post, timeType, listType,SYSdate
		//if (todayMinute == 15 || todayMinute == 30 || todayMinute == 45 || todayMinute == 59) 
		
		
		//
		/*
		if(todaySecond>=0){
			int result = sai.selectAnalytics(timeType);
			
			if (result > 0) {
				// 업데이트
				sai.updateAnalytics();
				
			} else {
				// 추가
				TodayAnalyticsDetail TAD = new TodayAnalyticsDetail(tHits, tLike, tComments, tPost, timeType, 1, "sysdate");

				if (sai.insertAnalytics(TAD) > 0) {
					TAD.setHits(hHits);
					TAD.setLike(hLike);
					TAD.setComments(hComments);
					TAD.setPost(hPost);
					TAD.setListType(2);
					if (sai.insertAnalytics(TAD) > 0) {
						TAD.setHits(cHits);
						TAD.setLike(cLike);
						TAD.setComments(cComments);
						TAD.setPost(cPost);
						TAD.setListType(3);
						sai.insertAnalytics(TAD);
						System.out.println("됫다C반");
					}

				}
				
			}
		}

		// 00시일경우 값을 업데이트 한번하고, 초기화
		if (todayHour == 12 || todayHour == 15 || todayHour == 18 || todayHour == 21 || todayHour == 00) 
		{
			int result = sai.updateAnalytics();
			if (result > 0) {
			} else {
			}
			tHits = 0;
			tLike = 0;
			tComments = 0;
			tPost = 0;
			hHits = 0;
			hLike = 0;
			hComments = 0;
			hPost = 0;
			cHits = 0;
			cLike = 0;
			cComments = 0;
			cPost = 0;

		}*/
		// 요까지. (확인해보니 SystemAnalyticsInsert에서 Resource 명이 중복되서그러는거같음)

	}
}
