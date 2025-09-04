package com.exam.gagi.dao;

import java.util.List;

public interface BaseBoardDao<T> {
	// ���� ����Ʈ ��ȸ(�˻� + ����¡)
	List<T> selectList(String search, int page, int size);
		
	// �� �Խñ� ��
	int selectCount(String search);
		
	// �Խñ� �� ��ȸ
	T selectPost(int id); 
	
}
