package ouhk.groupproject.model;


public class Base64image {

    private long food_id;

    private String base64img;

    public Base64image() {

    }
    
    public Base64image(long food_id, String base64img) {
        this.food_id = food_id;
        this.base64img = base64img;
    }

    public long getFood_id() {
        return food_id;
    }

    public void setFood_id(long food_id) {
        this.food_id = food_id;
    }

    public String getBase64img() {
        return base64img;
    }

    public void setBase64img(String base64img) {
        this.base64img = base64img;
    }
    
    
    
}
