package fit.lythithuy.dao;

import fit.lythithuy.beans.Product;
import fit.lythithuy.util.DBUtil;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    // select insert update delete...
    private DBUtil dbUtil;


    public ProductDAO(DataSource dataSource) {
        dbUtil = new DBUtil(dataSource);
    }


    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (var conn = dbUtil.getConnection();
             var stmt = conn.createStatement();
             var rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Integer id = rs.getInt("id");
                String model = rs.getString("model");
                Double price = rs.getDouble("price");
                Integer quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                Product product = new Product(id, model, price, quantity, description);
                products.add(product);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return products;
    }


    public Product getProductById(Integer id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (var conn = dbUtil.getConnection();
             var stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (var rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String model = rs.getString("model");
                    Double price = rs.getDouble("price");
                    Integer quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    return new Product(id, model, price, quantity, description);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
