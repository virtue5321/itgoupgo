package com.itgoupgo.community.free.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
// > @AllArgsConstructor 를 이용해서 모든 필드에 대한 매개변수 생성자를 안만든 이유
//   사실 스프링에서는 내가 직접 VO 객체를 만들 일이 없음!!
//   또한 스프링이 주도권을 잡아서 VO 객체를 만들어 준다고 치더라도
//   스프링은 기본생성자 + setter 메소드 조합으로 VO 객체를 내부적으로 만들어 줌!!
//   (setter 주입 방식)
public class FreeReply {
	
	private int replyNo;
	private String replyContent;
	private int refBno;
	private String replyWriter; // "1" / "admin"
	private String createDate; // 작성일을 TO_CHAR 함수로 조회했기 때문
	private String status;

}
