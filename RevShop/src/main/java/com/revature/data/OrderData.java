package com.revature.data;

import java.io.Serializable;

public class OrderData implements Serializable{
	private String transactionId;
	private String productId;
	private int quantity;
	private Double amount;
	private int shipped;

	public OrderData() {
		super();
	}

	public OrderData(String transactionId, String productId, int quantity, Double amount) {
		super();
		this.transactionId = transactionId;
		this.productId = productId;
		this.quantity = quantity;
		this.amount = amount;
		this.shipped = 0;
	}

	public OrderData(String transactionId, String productId, int quantity, Double amount, int shipped) {
		super();
		this.transactionId = transactionId;
		this.productId = productId;
		this.quantity = quantity;
		this.amount = amount;
		this.shipped = shipped;
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public int getShipped() {
		return shipped;
	}

	public void setShipped(int shipped) {
		this.shipped = shipped;
	}

	@Override
	public String toString() {
		return "OrderData [transactionId=" + transactionId + ", productId=" + productId + ", quantity=" + quantity
				+ ", amount=" + amount + ", shipped=" + shipped + "]";
	}
	
}
