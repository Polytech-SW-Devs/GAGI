package com.exam.gagi.dao;

import java.util.List;
import java.util.Map;

import com.exam.gagi.model.Review;

public interface ReviewDao extends BaseBoardDao<Review> {
	
	// 리뷰 등록
    void insert(Review review);

    // 상품별 리뷰 목록 조회
    List<Review> selectListByTarget(int targetId);

    // 상품별 평균 평점 조회
    double getAverageRating(int targetId);

    // 리뷰작성 폼용: 상품명 + 닉네임 조회
	Map<String, Object> selectWriteInfo(int reviewerId, int targetId);
	

}
