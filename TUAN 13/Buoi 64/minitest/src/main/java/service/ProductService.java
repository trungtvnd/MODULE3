package service;

import model.Product;

import java.util.ArrayList;

public class ProductService {
    private static ArrayList<Product> products;

    static {
        products = new ArrayList<>();
        products.add(new Product(1, "Macbook Air 1", 2000, 10, "Apple"));
        products.add(new Product(2, "HP Mate 1", 1100, 20, "HP"));
        products.add(new Product(3, "Think Pad 490s", 1500, 25, "Lenovo"));
        products.add(new Product(4, "Xps 17", 2000, 8, "Dell"));
        products.add(new Product(5, "Lite Pro Book", 800, 15, "Asus"));
    }
    public void create(Product product){
        products.add(product);
    }

    public void edit(int index, Product product){
        products.set(index, product);
    }

    public void delete(Product product){
        products.remove(product);
    }

    public ArrayList<Product> display(){
        return products;
    }

    public Product findById(int id){
        for (Product product:products) {
            if(product.getId() == id){
                return product;
            }
        }return null;
    }

    public ArrayList<Product> sortByPrice(){
        products.sort((o1, o2) -> {
            if (o1.getPrice() < o2.getPrice()) {
                return -1;
            } else if (o1.getPrice() > o2.getPrice()) {
                return 1;
            }
            return 0;
        }); return products;
    }
}
