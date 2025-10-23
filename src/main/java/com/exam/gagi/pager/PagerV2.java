package com.exam.gagi.pager;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class PagerV2 {
	private int page = 1;
	private int perPage = 10;
	private int total;
	private int perGroup = 5;

	private int search;
	private String keyword;

	// 기본 생성자
	public PagerV2() {
	}

	// 편의 생성자
	public PagerV2(int page, int perPage) {
		this.page = page;
		this.perPage = perPage;
	}

	public PagerV2(int page, int perPage, int total) {
		this(page, perPage);
		this.total = total;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	// 마지막 페이지 계산
	public int getLast() {
		if (total == 0)
			return 1;
		return (int) Math.ceil((double) total / perPage);
	}

	// 이전 그룹 첫 페이지 계산
	public int getPrev() {
		int startPage = ((page - 1) / perGroup) * perGroup + 1;
		return Math.max(startPage - perGroup, 1);
	}

	// 다음 그룹 첫 페이지 계산 (옵션: 한 페이지씩 이동 원하면 기존 로직 사용)
	public int getNext() {
		int startPage = ((page - 1) / perGroup) * perGroup + 1;
		int next = startPage + perGroup;
		return Math.min(next, getLast());
	}

	// 현재 그룹 페이지 번호 리스트
	public List<Integer> getPageList() {
		List<Integer> list = new ArrayList<>();
		int startPage = ((page - 1) / perGroup) * perGroup + 1;
		int endPage = Math.min(startPage + perGroup - 1, getLast());

		for (int i = startPage; i <= endPage; i++) {
			list.add(i);
		}
		if (list.isEmpty())
			list.add(1);
		return list;
	}

	public int getSearch() {
		return search;
	}

	public void setSearch(int search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// URL 쿼리 문자열 생성
	public String getQuery() {
		if (search <= 0 || keyword == null || keyword.isBlank()) {
			return "";
		}
		return String.format("&search=%d&keyword=%s", search, URLEncoder.encode(keyword, StandardCharsets.UTF_8));
	}

	// 디버깅용 toString()
	@Override
	public String toString() {
		return "PagerV2{" + "page=" + page + ", perPage=" + perPage + ", total=" + total + ", perGroup=" + perGroup
				+ ", search=" + search + ", keyword='" + keyword + '\'' + '}';
	}
}
