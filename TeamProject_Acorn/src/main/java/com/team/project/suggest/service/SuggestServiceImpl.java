package com.team.project.suggest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.project.suggest.dao.SuggestDao;

@Service
public class SuggestServiceImpl implements SuggestService{
	@Autowired
	private SuggestDao suggestDao;
}
