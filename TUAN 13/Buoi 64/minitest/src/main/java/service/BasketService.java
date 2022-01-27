package service;

import model.Basket;
import model.Product;

import java.util.ArrayList;

public class BasketService {
    private static ArrayList<Basket> baskets;

    static {
        baskets = new ArrayList<>();
        baskets.add(new Basket("Macbook Air 1", 2000, 1));
//        baskets.add(new Basket("HP Mate 1", 1100, 1));
//        baskets.add(new Basket("Think Pad 490s", 1500,1 ));
//        baskets.add(new Basket("Xps 17", 2000, 1));
//        baskets.add(new Basket("Lite Pro Book", 800, 1));
    }
    public void create(Basket product){
        baskets.add(product);
    }

    public void edit(int index, Basket product){
        baskets.set(index, product);
    }

    public void delete(Basket product){
        baskets.remove(product);
    }

    public ArrayList<Basket> display(){
        return baskets;
    }

    public Basket findById(String name){
        for (Basket product:baskets) {
            if(product.getName().equals(name)){
                return product;
            }
        }return null;
    }


}
