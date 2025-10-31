package com.itgoupgo.community.common.template;

import com.itgoupgo.community.common.model.vo.PageInfo;

// 페이징 처리 시마다 필요한 7개의 변수를 셋팅하는 공통 코드
public class Pagination {

	// 4개의 기본변수를 매개변수로 받아서 3개의 변수를 계산해서 PageInfo 로 리턴
	public static PageInfo getPageInfo(int listCount,
								  	   int currentPage,
								  	   int pageLimit,
								  	   int boardLimit) {
		
		// 위의 4개의 변수를 가지고 나머지 3개의 변수를 계산할 것!!
		// > 항상 그 4개의 변수가 제대로 셋팅되었는지 확인하고 넘어가야함
		
		// * maxPage : 가장 마지막 페이지가 몇 번 페이지인지
		/*
		 * maxPage 구하기 - listCount, boardLimit 의 영향을 받음
		 * 
		 * - 공식 구하기
		 * 단, boardLimit 가 10 이라는 가정 하에 규칙을 구해보자
		 * 
		 * 총 갯수 (listCount) 	boardLimit		maxPage
		 * 100.0 개				/ 10 => 10.0	10
		 * 101.0 개				/ 10 => 10.1	11
		 * 107.0 개				/ 10 => 10.7	11
		 * 109.0 개				/ 10 => 10.9	11
		 * 110.0 개				/ 10 => 11.0	11
		 * 112.0 개				/ 10 => 11.2	12
		 * 115.0 개				/ 10 => 11.5	12
		 * ...
		 * => 컴퓨터의 값 처리 규칙 때문에 정수끼리 나누면 정수로 몫이 나옴!!
		 *    이걸 maxPage 값이랑 맞춰줘야함!!
		 * => 일부러 실수로써 나눗셈 후 결과를 올림처리 한다면? 
		 *    maxPage 값 도출 가능
		 * 
		 * 1) listCount 를 double 으로 강제형변환
		 * 2) listCount / boardLimit
		 * 3) 결과를 올림처리 (Math.ceil)
		 * 4) 결과값을 int 로 강제형변환
		 * 
		 * maxPage = (int)Math.ceil((double)listCount / boardLimit);
		 */
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * startPage : 페이지 하단에 보여질 페이징바의 시작수
		/*
		 * startPage 구하기 - pageLimit, currentPage 의 영향을 받음
		 * 
		 * - 공식 구하기
		 * 단, pageLimit 가 10 이라는 가정 하에 규칙을 구해보자!!
		 * 
		 * 만약에 pageLimit 가 10 이라면..
		 * startPage : 1, 11, 21, 31, 41, 51, 61, ...
		 * > n * 10 + 1
		 *   (n 이 0 부터 시작한다라는 가정 하에 "10 의 배수 + 1")
		 * 
		 * 만약에 pageLimit 가 5 라면..
		 * startPage : 1, 6, 11, 16, 21, ...
		 * > n * 5 + 1
		 *   (n 이 0 부터 시작한다라는 가정 하에 "5 의 배수 + 1")
		 *   
		 * 즉, startPage = n * pageLimit + 1;
		 * 
		 * 위의 공식은 전반적인 틀일 뿐!! 실제 n 을 구하는 규칙까지 파악해야함
		 * (0 부터 시작되게끔 구해야함!!)
		 * 
		 * pageLimit 가 10 이라면...
		 * currentPage		startPage
		 * 1				1
		 * 5				1
		 * 10				1
		 * 11				11
		 * 15				11
		 * 19				11
		 * 20				11
		 * 21				21
		 * 26				21
		 * 30				21
		 * ...
		 * > currentPage 가
		 *   1 ~ 10 페이지일 경우 : startPage = 1 = n * 10 + 1 (n == 0)
		 *   11 ~ 20 페이지일 경우 : startPage = 11 = n * 10 + 1 (n == 1)
		 *   21 ~ 30 페이지일 경우 : startPage = 21 = n * 10 + 1 (n == 2)
		 *   31 ~ 40 페이지일 경우 : startPage = 31 = n * 10 + 1 (n == 3)
		 *   ...
		 * 
		 * 최종적으로 n 을 구해보기!!
		 * (currentPage - 1) / pageLimit = (1 - 1) / 10 = 0
		 * 						     	   (2 - 1) / 10 = 0
		 * 							 	   (3 - 1) / 10 = 0
		 * 							 		...
		 * 							 	   (9 - 1) / 10 = 0
		 * 							 	   (10 - 1) / 10 = 0
		 * 							 	   (11 - 1) / 10 = 1
		 * 								   (12 - 1) / 10 = 1
		 * 							 	   (15 - 1) / 10 = 1
		 * 							 	   (20 - 1) / 10 = 1
		 * 							 		...
		 * 즉, n = (currentPage - 1) / pageLimit;
		 * 
		 * 최종 공식을 합쳐주면...
		 * startPage = 					n		     * pageLimit + 1;
		 * 			 = (currentPage - 1) / pageLimit * pageLimit + 1;
		 */
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 페이지 하단에 보여질 페이징바의 끝수
		/*
		 * endPage 구하기 - startPage, pageLimit 의 영향을 받음
		 * 				  단, maxPage 도 종종 영향을 줌!!
		 * 
		 * - 공식 구하기
		 * 단, pageLimit 가 10 이라는 가정 하에 규칙을 구해보자!!
		 * 
		 * startPage : 1 => endPage : 10
		 * startPage : 11 => endPage : 20
		 * startPage : 21 => endPage : 30
		 * ...
		 * > 즉, endPage = startPage + pageLimit - 1;
		 */
		
		int endPage = startPage + pageLimit - 1;
		
		// 단, startPage 가 11 이여서 endPage 가 20 으로 계산되는 상황에서
		// maxPage 가 11 까지만 있었다면? endPage 도 11 이 되야함
		// maxPage 가 17 까지만 있었다면? endPage 도 17 이 되야함
		// > 이 경우에는 maxPage 가 곧 endPage 로 되야함
		if(endPage > maxPage) {
			
			endPage = maxPage;
		}
		
		// 계산된 결과를 리턴
		// return maxPage, startPage, endPage;
		
		// 매개변수로 받은 4개의 변수값
		// + 여기서 방금 계산한 3개의 변수값
		// = 한번에 PageInfo 객체에 다 담을 수 있음..!
		PageInfo pi = new PageInfo(listCount, currentPage,
								   pageLimit, boardLimit,
								   maxPage, startPage, endPage);
		return pi;
	}
	
}
