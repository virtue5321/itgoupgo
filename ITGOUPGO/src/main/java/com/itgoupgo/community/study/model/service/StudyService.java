package com.itgoupgo.community.study.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itgoupgo.community.study.model.dao.StudyDao;
import com.itgoupgo.community.study.model.vo.StudyBbs; // StudyBbs VO 사용

/**
 * 스터디모집 게시판 Service Layer
 * 비즈니스 로직을 처리하고 트랜잭션을 관리합니다.
 */
@Service
public class StudyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession; // MyBatis 쿼리 실행을 위한 SqlSessionTemplate
	
	@Autowired
	private StudyDao studyDao; // 데이터베이스 접근을 위한 DAO 주입

    // 게시글 목록 페이징 처리를 위한 상수 설정
    private static final int BOARD_LIMIT = 10; 
	
	/**
	 * 전체 게시글 개수 조회
	 * @return 전체 게시글 수
	 */
	public int selectListCount() {
		return studyDao.selectListCount(sqlSession);
	}
	
	/**
	 * 게시글 목록 조회 (페이징 적용)
	 * @param currentPage 현재 페이지 번호
	 * @return 현재 페이지에 해당하는 게시글 목록
	 */
	public List<StudyBbs> selectList(int currentPage) {
        // 페이징 처리를 위한 offset 계산
        int offset = (currentPage - 1) * BOARD_LIMIT;
        
        // RowBounds 객체 생성 (offset: 건너뛸 행 수, limit: 가져올 행 수)
        RowBounds rowBounds = new RowBounds(offset, BOARD_LIMIT);
        
		return studyDao.selectList(sqlSession, rowBounds);
	}

    /**
     * 게시글 상세 조회 및 조회수 증가 처리 (트랜잭션 적용)
     * @param studyNo 조회할 게시글 번호
     * @return 조회된 StudyBbs 객체
     */
    @Transactional
    public StudyBbs selectStudyBbs(int studyNo) {
        
        // 1. 조회수 증가
        int result = studyDao.increaseStudyBbsCount(sqlSession, studyNo);
        
        StudyBbs study = null;
        
        // 2. 조회수 증가 성공 시 게시글 조회
        if(result > 0) {
        	study = studyDao.selectStudyBbs(sqlSession, studyNo);
        }
        
        return study; // 게시글 조회 실패 시 null 반환
    }

    /**
     * 새로운 게시글 등록 (트랜잭션 적용)
     * @param f 등록할 StudyBbs 객체
     * @return 처리된 행의 수
     */
    @Transactional
    public int insertStudyBbs(StudyBbs study) {
        return studyDao.insertStudyBbs(sqlSession, study);
    }
    
    /**
     * 게시글 삭제 (삭제 상태 업데이트) (트랜잭션 적용)
     * @param studyNo 삭제할 게시글 번호
     * @return 처리된 행의 수
     */
    @Transactional
    public int deleteStudyBbs(int studyNo) {
        return studyDao.deleteStudyBbs(sqlSession, studyNo);
    }
    
    @Transactional
    public int deleteStudyBbsCheck(List<Integer> bbsNoList) {
        return studyDao.deleteStudyBbsCheck(sqlSession, bbsNoList);
    }
}
