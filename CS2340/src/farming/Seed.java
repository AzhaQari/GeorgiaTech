
package farming;

public class Seed {
    private int quantity;
    private String name;
//    price

    public Seed(int quantity, String name) {
        this.quantity = quantity;
        this.name = name;
    }

    public Seed(String name) {
        this.name = name;
    }

    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
