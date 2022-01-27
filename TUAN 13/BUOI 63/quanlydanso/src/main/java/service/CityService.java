package service;

import model.City;

import java.util.ArrayList;

public class CityService {
    private static ArrayList<City> cities;
    private static ArrayList<String> coutries;

    static {
        cities = new ArrayList<>();
        cities.add(new City(1, "Tokyo", 2189, 13298000, 1479, "Japan"));
        cities.add(new City(2, "ShangHai", 6340, 34256800, 1687, "China"));
        cities.add(new City(3, "Moskva", 2510, 12197500, 1479, "Russia"));
        coutries = new ArrayList<>();
        coutries.add("VN");
        coutries.add("TL");
        coutries.add("KOR");
        coutries.add("JPN");

    }
    public ArrayList<String> getCountries(){
        return coutries;
    }

    public void create(City City){
        cities.add(City);
    }

    public void edit(int index, City City){
        cities.set(index, City);
    }

    public void delete(City City){
        cities.remove(City);
    }

    public ArrayList<City> display(){
        return cities;
    }

    public City findById(int id){
        for (City City:cities) {
            if(City.getId() == id){
                return City;
            }
        }return null;
    }
}
