package com.exam.gagi.service;

import java.util.List;

public abstract class BaseBoardService<T> {
	
	// ���� ����Ʈ ��ȸ(����¡ + �˻�)
	public abstract List<T> getList(String search, int page, int size);
	
	// ���� �Խñ� �� ��ȸ
	public abstract T getPost(int id);
	
	// ���� �� ���� ��ȸ(����¡ ����)
	public abstract int getCount(String search);

}
