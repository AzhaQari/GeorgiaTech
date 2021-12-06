
public class CheeseConnoisseur {
    private String nameCon;
    private Cheese cheese;
    private double money;

    /**
     * Constructor for CheeseConnoisseur.
     * @param nameCon the name
     * @param money the money
     * @param cheese the cheese
     */
    public CheeseConnoisseur(String nameCon, double money, Cheese cheese) {
        this.nameCon = nameCon;
        this.money = money;
        this.cheese = cheese;
    }

    /**
     * Another constructor.
     * @param nameCon the nameCon
     * @param money the money
     */
    public CheeseConnoisseur(String nameCon, double money) {
        this (nameCon, money, null);
    }

    /**
     * Yet another constructor.
     * @param nameCon the name
     */
    public CheeseConnoisseur(String nameCon) {
        this (nameCon, 0.00);
    }

    /**
     * Default.
     */
    public CheeseConnoisseur() {
        this ("Louis Pasteur", 20.00, null);
    }

    /**
     *  Makes a trade.
     * @param cheese the cheese
     */
    public void makeTrade(Cheese cheese) { //Method 1
        this.cheese = cheese;
        this.cheese.cheeseTraded(cheese);
        if (cheese.getNumTrades() >= 3) {
            cheese.setSentient(true);
        }
    }

    /**
     * Makes a trade.
     * @param con the person to trade with
     */
    public void makeTrade(CheeseConnoisseur con) {
        Cheese sample = null;
        double payment;
        if (con.cheese == null || this.cheese == null) {
            return;
        } else if (this.cheese.equals(con.cheese)) {
            return;
        } else if (con.cheese.getCheesePrice() <= this.cheese.getCheesePrice()) {
            payment = Math.abs(this.cheese.getCheesePrice() - con.cheese.getCheesePrice());
            if (payment <= con.cheese.getCheesePrice()) {
                this.cheese.cheeseTraded(con.cheese);
                sample = this.cheese;
                this.cheese = con.cheese;
                con.cheese = sample;
            } else {
                return;
            }
        } else if (con.cheese.getCheesePrice() >= this.cheese.getCheesePrice()){
            payment = Math.abs(this.cheese.getCheesePrice() - con.cheese.getCheesePrice());
            if (this.cheese.getCheesePrice() > payment) {
                this.cheese.cheeseTraded(con.cheese);
                sample = this.cheese;
                this.cheese = con.cheese;
                con.cheese = sample;
            } else {
                return;
            }
        }

    }
}
