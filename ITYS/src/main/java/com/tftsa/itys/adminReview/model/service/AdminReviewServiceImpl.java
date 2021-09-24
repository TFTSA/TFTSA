package com.tftsa.itys.adminReview.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tftsa.itys.adminReview.model.dao.AdminReviewDao;
import com.tftsa.itys.adminReview.model.vo.AdminReview;

@Service("adminreviewService")
public class AdminReviewServiceImpl implements AdminReviewService{

	@Autowired
	private AdminReviewDao adminreviewDao;
	
	@Override
	public ArrayList<AdminReview> selectReviewAll() {
		return adminreviewDao.selectReviewAll();
	}
}