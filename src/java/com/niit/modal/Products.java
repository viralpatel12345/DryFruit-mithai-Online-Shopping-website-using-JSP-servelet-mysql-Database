package com.niit.modal;

public class Products 
{
    private String product_name;  
    private String product_weight; 
    private int item_count;
    private String order_id;
  
    private int product_id;
    private float product_price;

    public String getProduct_name()
    {
        return product_name;
    }

    public void setProduct_name(String product_name) 
    {
        this.product_name = product_name;
    }

    public String getProduct_weight() 
    {
        return product_weight;
    }

    public void setProduct_weight(String product_weight) 
    {
        this.product_weight = product_weight;
    }

    public int getItem_count() 
    {
        return item_count;
    }

    public void setItem_count(int item_count) 
    {
        this.item_count = item_count;
    }

    public String getOrder_id() 
    {
        return order_id;
    }

    public void setOrder_id(String order_id) 
    {
        this.order_id = order_id;
    }

    public int getProduct_id() 
    {
        return product_id;
    }

    public void setProduct_id(int product_id) 
    {
        this.product_id = product_id;
    }

    public float getProduct_price() 
    {
        return product_price;
    }

    public void setProduct_price(float product_price) 
    {
        this.product_price = product_price;
    }
     
}
