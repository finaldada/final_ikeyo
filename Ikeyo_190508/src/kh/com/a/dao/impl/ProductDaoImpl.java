package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.ProductDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.InventoryDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Autowired
	SqlSession sqlSession;
	String ns = "Product.";
	
	@Override
	public List<ProductDto> getProductPagingList(PagingParam param) {
		
		return sqlSession.selectList(ns + "getProductPagingList", param);
	}

	@Override
	public int getProductCount(PagingParam param) {
		
		return sqlSession.selectOne(ns + "getProductCount", param);
	}

	@Override
	public List<ProductDto> getProductList(String category) {
		
		return sqlSession.selectList(ns + "getProductList", category);
	}

	@Override
	public List<CartDto> getCartList(String category) {
		
		return sqlSession.selectList(ns + "getCartList", category);
	}

	@Override
	public int checkWish(CartDto cart) {
	
		return sqlSession.selectOne(ns + "checkWish", cart);
	}

	@Override
	public String updateWish(CartDto cart) throws Exception {
		int n = sqlSession.insert(ns + "updateWish", cart);
		String str = "";
		
		if(n>0) {
			str = "SUCCESS";
		} else {
			str = "FAIL";
		}
		
		return str;
	}

	@Override
	public String deleteWish(CartDto cart) throws Exception {
		int n = sqlSession.delete(ns + "deleteWish", cart);
		String str = "";
		
		if(n>0) {
			str = "SUCCESS";
		} else {
			str = "FAIL";
		}
		
		return str;
	}

	@Override
	public void updateCount(String model_id) throws Exception {
		sqlSession.update(ns + "updateCount", model_id);
	}

	@Override
	public void deleteCount(String model_id) throws Exception {
		sqlSession.update(ns + "deleteCount", model_id);
	}

	@Override
	public int selectCount(String model_id) {
		int n = sqlSession.selectOne(ns + "selectCount", model_id);
		
		if(n == 0) {
			return 0;
		} else {
			return n;
		} 
	}
	
	@Override
	public boolean productAdd(ProductDto productDto) {
		
		int n = sqlSession.insert(ns + "productAdd", productDto);
		
		return n>0?true:false;
	}

	@Override
	public ProductDto getProduct(String model_id) {		
		ProductDto pdto = sqlSession.selectOne(ns + "productDetila", model_id);
		
		return pdto;
	}

	@Override
	public InventoryDto getinven(String model_id) {
		
		InventoryDto idto = sqlSession.selectOne(ns + "getinven", model_id);
		
		return idto;
	}
	
	
	
	
}
