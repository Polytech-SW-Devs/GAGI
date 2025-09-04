package com.exam.gagi.service;

import java.util.List;

public interface BaseBoardService<T> {
	
	// ���� ����Ʈ ��ȸ(�˻� + ����¡)
	List<T> getList(String search, int page, int size);
	
	// �� �Խñ� ��
	int getCount(String search);
	
	// �Խñ� �� ��ȸ
	T getPost(int id); 
}
