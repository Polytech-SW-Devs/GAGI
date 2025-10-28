package com.exam.gagi.pager;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class AdminProductPager extends PagerV2 {

	private Long minPrice;

	private Long maxPrice;

	private boolean outOfStock; // 재고 0인 상품만 보기

	private String startDate;

	private String endDate;

	@Override

	public String getQuery() {

		String query = super.getQuery();

		if (minPrice != null) {

			query += "&minPrice=" + minPrice;

		}

		if (maxPrice != null) {

			query += "&maxPrice=" + maxPrice;

		}

		if (outOfStock) {

			query += "&outOfStock=true";

		}

		if (startDate != null && !startDate.isBlank()) {

			query += String.format("&startDate=%s", URLEncoder.encode(startDate, StandardCharsets.UTF_8));

		}

		if (endDate != null && !endDate.isBlank()) {

			query += String.format("&endDate=%s", URLEncoder.encode(endDate, StandardCharsets.UTF_8));

		}

		return query;

	}

	public Long getMinPrice() {

		return minPrice;

	}

	public void setMinPrice(Long minPrice) {

		this.minPrice = minPrice;

	}

	public Long getMaxPrice() {

		return maxPrice;

	}

	public void setMaxPrice(Long maxPrice) {

		this.maxPrice = maxPrice;

	}

	public boolean isOutOfStock() {

		return outOfStock;

	}

	public void setOutOfStock(boolean outOfStock) {

		this.outOfStock = outOfStock;

	}

	public String getStartDate() {

		return startDate;

	}

	public void setStartDate(String startDate) {

		this.startDate = startDate;

	}

	public String getEndDate() {

		return endDate;

	}

	public void setEndDate(String endDate) {

		this.endDate = endDate;

	}

}
