package fit.lythithuy.beans;

import java.io.Serial;
import java.io.Serializable;

public class Product implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;
    private Integer id;
    private String model;
    private double price;
    private int quantity;
    private String description;

    public Product() {
    }

    public Product(Integer id, String model, double price, int quantity, String description) {
        this.id = id;
        this.model = model;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public String getModel() {
        return model;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
