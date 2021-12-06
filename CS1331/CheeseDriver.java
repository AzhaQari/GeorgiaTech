
public class CheeseDriver {
    public static void main(String[] args) {
        Cheese test1 = new Cheese(1, "cheddar", 3);
        Cheese test2 = new Cheese(3, "colby-jack");
        Cheese test3 = new Cheese(5, "pepperjack", 2);
        Cheese test4 = new Cheese();

        CheeseConnoisseur con1 = new CheeseConnoisseur();
        CheeseConnoisseur con2 = new CheeseConnoisseur("Jerry", 6.00);
        CheeseConnoisseur con3 = new CheeseConnoisseur();
        CheeseConnoisseur con4 = new CheeseConnoisseur();

        con1.makeTrade(test2);
        con2.makeTrade(test3);
        con3.makeTrade(con4);
        con4.makeTrade(con1);
        con1.makeTrade(test3);
        con2.makeTrade(test4);
        con3.makeTrade(test2);
        con4.makeTrade(test3);

        System.out.println(test1.getSentient());
        System.out.println(test2.getSentient());
        System.out.println(test3.getSentient());
        System.out.println(test4.getSentient());


    }
}
