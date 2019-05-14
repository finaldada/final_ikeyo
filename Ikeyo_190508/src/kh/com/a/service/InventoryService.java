package kh.com.a.service;

import java.util.List;

import kh.com.a.model.InventoryDto;

public interface InventoryService {

	public List<InventoryDto> getInventoryList();
	public boolean inventoryWrite(InventoryDto inven);
	public InventoryDto inventoryDetail(InventoryDto inven);
	public String inventoryCheck(String model_id);
	public boolean inventoryUpdate(InventoryDto inven);
	
	public InventoryDto getInventory(int inven_seq);
}
