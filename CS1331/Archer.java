/**
* @author Azha Qari
* @version 1.0
*/
public class Archer extends Adventurer {
    private int numArrows = 10;
    /**
    * Constructor for archer that takes in 3 parameters.
    * @param name the archers name.
    * @param health the archers health.
    * @param power the archers power.
    */
    public Archer(String name, int health, int power) {
        this.name = name;
        this.health = health;
        this.power = power;
    }
    /**
    * Constructor for archer that takes in 1 parameter.
    * @param name the archers name.
    */
    public Archer(String name) {
        this.name = name;
        this.health = 75;
        this.power = 40;
    }

    @Override
    public void attack(Adventurer a) {
        if (a == null) {
            return;
        }
        if (this.health > 0 && this.numArrows >= 1) {
            a.health -= this.power;
            if (a.health <= 0) {
                a.health = 0;
            }
            this.numArrows -= 1;
        }
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Archer)) {
            return false;
        }
        Archer a = (Archer) o;
        return (this.health == a.health && this.power == a.power && this.name.equals(a.name));
    }

    @Override
    public String toString() {
        return "Name: " + this.name + ", Health: " + this.health
            + ", Attack: " + this.power + ", Arrows: " + this.numArrows;
    }
/*
    public void setNumArrows(int a) {
        numArrows = a;
    }
    public int getNumArrows() {
        return numArrows;
    }
*/

}
