package com.exam.gagi.pager;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class Pager {
	// 현재 보고 있는 페이지 번호
	private int page = 1;
	// 페이지 당 표시할 항목 개수
	private int perPage = 5;
	// 전체 항목 개수
	private float total;
	// 한 그룹에 표시할 페이지 개수
	private int perGroup = 3;

	private int search;
	private String keyword;

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

	public int getLast() {
		if (total == 0) {
			return 1;
		}
		return (int) Math.ceil(total / perPage);
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getNext() {
		int next = page + 1;
		int last = getLast();

		return Math.min(next, last);
	}

	public int getPrev() {
		return page <= perGroup ? 1 : (((page - 1) / perGroup) - 1) * perGroup + 1;
	}

	public int getPerGroup() {
		return perGroup;
	}

	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}

	public List<Integer> getList() {
		ArrayList<Integer> list = new ArrayList<Integer>();

		int startPage = (((page - 1) / perGroup) + 0) * perGroup + 1;
		int last = getLast();

		for (int i = startPage; i < (startPage + perGroup) && i <= last; i++) {
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

	public String getQuery() {
		StringBuilder query = new StringBuilder();

		try {
			if (search > 0 && keyword != null && !keyword.trim().isEmpty()) {
				query.append("&search=").append(search);
				query.append("&keyword=").append(URLEncoder.encode(keyword, StandardCharsets.UTF_8.name()));
			}
		} catch (UnsupportedEncodingException e) {
			// StandardCharsets.UTF_8.name()은 항상 유효하므로 이 예외는 거의 발생하지 않습니다.
			// 필요 시 로깅 처리
		}

		return query.toString();
	}
}