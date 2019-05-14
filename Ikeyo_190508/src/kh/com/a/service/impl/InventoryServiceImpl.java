package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.InventoryDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.InventoryDto;
import kh.com.a.service.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {

	@Autowired
	InventoryDao inventoryDao;

	@Override
	public List<InventoryDto> getInventoryList() {
	
		return inventoryDao.getInventoryList();
	}

	@Override
	public boolean inventoryWrite(InventoryDto inven) {
		
		return inventoryDao.inventoryWrite(inven);
	}

	@Override
	public InventoryDto inventoryDetail(InventoryDto inven) {
		
		return inventoryDao.inventoryDetail(inven);
	}

	@Override
	public String inventoryCheck(String model_id) {
		
		return inventoryDao.inventoryCheck(model_id);
	}

	@Override
	public boolean inventoryUpdate(InventoryDto inven) {
		
		return inventoryDao.inventoryUpdate(inven);
	}

	@Override
	public boolean inventoryDelete(InventoryDto inven) {
		
		return inventoryDao.inventoryDelete(inven);
	}

	@Override
	public List<InventoryDto> getInventoryPagingList(BbsParam param) {
		
		return inventoryDao.getInventoryPagingList(param);
	}

	@Override
	public int getInventoryCount(BbsParam param) {
		
		return inventoryDao.getInventoryCount(param);
	} 
	
	
	
	
	
	
	
	
	
	
	
	
	
}
