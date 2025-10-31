package com.itgoupgo.community.info.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.itgoupgo.community.info.model.vo.InfoBbs; // InfoBbs VO로 변경

/**
 * 정보 공유 게시판 Data Access Object (DAO)
 * MyBatis를 사용하여 데이터베이스와 통신합니다.
 */
@Repository
public class InfoDao {

    /**
     * 전체 게시글 개수 조회
     * @param sqlSession MyBatis SqlSessionTemplate
     * @return 전체 게시글 수
     */
    public int selectListCount(SqlSessionTemplate sqlSession) {
        // "adminMapper" 네임스페이스의 "selectInfoListCount" ID를 가진 쿼리를 실행
        return sqlSession.selectOne("adminMapper.selectInfoListCount");
    }

    /**
     * 현재 페이지에 해당하는 게시글 목록 조회 (페이징 적용)
     * @param sqlSession MyBatis SqlSessionTemplate
     * @param rowBounds 페이징 처리를 위한 RowBounds 객체 (offset, limit 정보 포함)
     * @return 조회된 InfoBbs 목록
     */
    public List<InfoBbs> selectList(SqlSessionTemplate sqlSession, RowBounds rowBounds) {
        // "adminMapper" 네임스페이스의 "selectInfoList" ID를 가진 쿼리를 실행
        return sqlSession.selectList("adminMapper.selectInfoList", null, rowBounds);
    }

    /**
     * 특정 게시글 번호(bbsNo)로 게시글 조회
     * @param sqlSession MyBatis SqlSessionTemplate
     * @param bbsNo 조회할 게시글 번호
     * @return 조회된 InfoBbs 객체
     */
    public InfoBbs selectInfoBbs(SqlSessionTemplate sqlSession, int bbsNo) {
        return sqlSession.selectOne("infoMapper.selectInfoBbs", bbsNo); // infoMapper 사용
    }

    /**
     * 게시글 조회수 1 증가
     * @param sqlSession MyBatis SqlSessionTemplate
     * @param bbsNo 조회수 증가 대상 게시글 번호
     * @return 처리된 행의 수 (1이면 성공)
     */
    public int increaseInfoBbsCount(SqlSessionTemplate sqlSession, int bbsNo) {
        return sqlSession.update("infoMapper.increaseInfoBbsCount", bbsNo); // infoMapper 사용
    }

    /**
     * 새로운 게시글 등록
     * @param sqlSession MyBatis SqlSessionTemplate
     * @param i 등록할 InfoBbs 객체 (제목, 내용, 작성자 회원번호 등 포함)
     * @return 처리된 행의 수 (1이면 성공)
     */
    public int insertInfoBbs(SqlSessionTemplate sqlSession, InfoBbs i) {
        return sqlSession.insert("adminMapper.insertInfoBbs", i);
    }

    /**
     * 단일 게시글 삭제 (실제로는 삭제 상태를 'Y'로 업데이트)
     * @param sqlSession MyBatis SqlSessionTemplate
     * @param bbsNo 삭제할 게시글 번호
     * @return 처리된 행의 수 (1이면 성공)
     */
    public int deleteInfoBbs(SqlSessionTemplate sqlSession, int bbsNo) {
        // 상태값만 변경하는 UPDATE 쿼리를 호출합니다.
        return sqlSession.update("adminMapper.deleteInfoBbs", bbsNo);
    }
    
    /**
     * 게시글 일괄 삭제 (실제로는 삭제 상태를 'Y'로 업데이트)
     * @param sqlSession MyBatis SqlSessionTemplate
     * @param bbsNoList 삭제할 게시글 번호 리스트
     * @return 처리된 행의 수 (성공적으로 처리된 개수)
     */
    public int deleteInfoBbsCheck(SqlSessionTemplate sqlSession, List<Integer> bbsNoList) {
        // 상태값만 변경하는 UPDATE 쿼리를 호출합니다.
        return sqlSession.update("adminMapper.deleteInfoBbsCheck", bbsNoList);
    }
}
