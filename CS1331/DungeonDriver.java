
public class DungeonDriver {
    public static void main(String[] args) {
        Knight k1 = new Knight("Galahad", 7, 6, true);
        Knight k2 = new Knight("Lancelot", 30, 5, false);

        Archer a1 = new Archer("Archie", 10, 2);

        //Attack #1:
        a1.attack(k2);
        System.out.println(a1.toString());
        System.out.println(k2.toString());

        //Attack #2:
        k1.attack(a1);
        System.out.println(k1.toString());
        System.out.println(a1.toString());

        //Attack #3:
        a1.attack(k1);
        System.out.println(a1.toString());//nothing should happen bc a1 health = 0
        System.out.println(k1.toString());

        //Attack #4:
        k2.attack(k1);
        System.out.println(k1.toString());
        System.out.println(k2.toString());

        //Challenge #1:
        k2.challenge(k1);
        System.out.println(k1.toString());
        System.out.println(k2.toString());
    }
}
