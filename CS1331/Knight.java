/**
* @author Azha Qari
* @version 1.0
*/

public class Knight extends Adventurer {
    private boolean hasSquire;
    /**
    * Constructor for knight that takes in 4 parameters.
    * @param name the knights name.
    * @param health the knights health.
    * @param power the knights power.
    * @param hasSquire whether or not the knight has a squire.
    */
    public Knight(String name, int health, int power, boolean hasSquire) {
        this.name = name;
        this.health = health;
        this.power = power;
        this.hasSquire = hasSquire;
    }
    /**
    * Constructor for knight that takes in 1 parameter.
    * @param name the knights name.
    */
    public Knight(String name) {
        this.name = name;
        this.health = 100;
        this.power = 15;
        this.hasSquire = true;
    }

    @Override
    public void attack(Adventurer a) {
        if (a == null || this.health <= 0) {
            return;
        } else {
            if (this.hasSquire) {
                a.health -= (2 * this.power);
                if (a.health < 0) {
                    a.health = 0;
                }
            } else if (!this.hasSquire) {
                a.health -= this.power;
                if (a.health < 0) {
                    a.health = 0;
                }
            }
        }
    }
    /**
    * Method to simulate one knight challenging another.
    * @param k is a knight object.
    */
    public void challenge(Knight k) {
        if (k == null) {
            return;
        } else {
            if (this.health > 0 && k.health >= 0 && !this.hasSquire && k.hasSquire) {
                this.attack(k);
                if (k.health <= 0) {
                    k.hasSquire = false;
                    this.hasSquire = true;
                } else {
                    k.attack(this);
                }
            }
        }
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Knight)) {
            return false;
        }
        Knight k = (Knight) o;
        return (this.health == k.health && this.power == k.power
            && this.name.equals(k.name) && this.hasSquire == k.hasSquire);
    }

    @Override
    public String toString() {
        return "Name: " + this.name + ", Health: " + this.health + ", Attack: " + this.power
            + ", Squire: " + this.hasSquire;
    }

    /*
    public void setHasSquire(boolean hasSquire) {
        this.hasSquire = hasSquire;
    }
    public boolean getHasSquire() {
        return hasSquire;
    }
    */
}
