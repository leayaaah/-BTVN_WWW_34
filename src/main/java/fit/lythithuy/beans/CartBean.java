package fit.lythithuy.beans;

import java.util.List;

public class CartBean {
    private List<CartItemBean> items;

    public CartBean() {
        items = new java.util.ArrayList<>();
    }

    public List<CartItemBean> getItems() {
        return items;
    }
    public void addProduct(Product product) {
        for (CartItemBean item : items) {
            if (item.getProduct().getId().equals(product.getId())) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }
        items.add(new CartItemBean(product, 1));
    }

    public void removeProduct(String productId) {
        items.removeIf(item -> item.getProduct().getId().equals(productId));
    }

    public void updateQuantity(String productId, int quantity) {
        for (CartItemBean item : items) {
            if (item.getProduct().getId().equals(productId)) {
                item.setQuantity(quantity);
                return;
            }
        }
    }

    public double getTotal() {
        double total = 0;
        for (CartItemBean item : items) {
            total += item.getSubtotal();
        }
        return total;
    }

    public void clear() {
        items.clear();
    }

}
