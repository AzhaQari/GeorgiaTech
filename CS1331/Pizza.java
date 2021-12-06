//I worked on this hw alone, using only course materials
//Azha Qari

public class Pizza {
    private int numSlices;
    private String[] toppings;
    private boolean hasCheese;
    private boolean isGlutenFree;

    public Pizza() {
        numSlices = 8;
        hasCheese = true;
        isGlutenFree = false;
        toppings = new String[0];

    }
    public Pizza(int numSlices, boolean hasCheese, boolean isGlutenFree, String[] toppings) {
        this.numSlices = numSlices;
        this.hasCheese = hasCheese;
        this.isGlutenFree = isGlutenFree;
        this.toppings = toppings;
    }
    public String[] getToppings() {
        return toppings;
    }
    public void setToppings(String[] toppings) {
        this.toppings = toppings;
    }
    public int getNumSlices() {
        return numSlices;
    }
    public void setNumSlices(int numSlices) {
        this.numSlices = numSlices;
    }
    public void setHasCheese(boolean hasCheese) {
        this.hasCheese = hasCheese;
    }
    public void setIsGlutenFree(boolean isGlutenFree) {
        this.isGlutenFree = isGlutenFree;
    }

    public void printToppings() {
        System.out.println("Pizza Toppings:");
        for (int i = 0; i < toppings.length; i++) {
            System.out.println(toppings[i]);
        }
    }
    public void changeFirstTopping(String newTopping) {
        if (toppings.length > 0) {
            toppings[0] = newTopping;
        }
    }

    public static void main(String[] args) {

    }
}
