package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CartDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;

public interface ProductDao {
	public List<ProductDto> getProductList(String category);
	public List<ProductDto> getProductPagingList(PagingParam param);
	public int getProductCount(PagingParam param);
	public List<CartDto> getCartList(String category);
	public int checkWish(CartDto cart);
	public String updateWish(CartDto cart) throws Exception;
	public String deleteWish(CartDto cart) throws Exception;
	public void updateCount(String model_id) throws Exception;
	public void deleteCount(String model_id) throws Exception;
	public int selectCount(String model_id);
	public boolean productAdd(ProductDto productDto);

}
