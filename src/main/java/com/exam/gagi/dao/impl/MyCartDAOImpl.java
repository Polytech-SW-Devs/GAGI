package com.exam.gagi.dao.impl;

import com.exam.gagi.dao.MyCartDAO;
import com.exam.gagi.model.MyCart;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyCartDAOImpl implements MyCartDAO {

    private final SqlSession sqlSession;
    private static final String NAMESPACE = "mycart.";

    public MyCartDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void insertCart(MyCart cart) {
        sqlSession.insert(NAMESPACE + "insertCart", cart);
    }

    @Override
    public List<MyCart> findByUserId(int userId) {
        return sqlSession.selectList(NAMESPACE + "findByUserId", userId);
    }

    @Override
    public MyCart findByUserAndItem(int userId, int itemId) {
        MyCart param = new MyCart();
        param.setUserId(userId);
        param.setItemId(itemId);
        return sqlSession.selectOne(NAMESPACE + "findByUserAndItem", param);
    }

    @Override
    public void updateQuantity(int userId, int itemId, int quantity) {
        MyCart param = new MyCart();
        param.setUserId(userId);
        param.setItemId(itemId);
        param.setQuantity(quantity);
        sqlSession.update(NAMESPACE + "updateQuantity", param);
    }

    @Override
    public void deleteCartItem(int userId, int itemId) {
        MyCart param = new MyCart();
        param.setUserId(userId);
        param.setItemId(itemId);
        sqlSession.delete(NAMESPACE + "deleteCartItem", param);
    }

    @Override
    public void deleteAllByUserId(int userId) {
        sqlSession.delete(NAMESPACE + "deleteAllByUserId", userId);
    }
    
    @Override
    public int findItemStock(int itemId) {
        return sqlSession.selectOne(NAMESPACE + "findItemStock", itemId);
    }
    
}

