public class Pikachu extends Pokemon {
    private int friendshipLevel;
    public Pikachu(String trainerName, int health, int maxHealth, int friendshipLevel) {
        super(trainerName, health, maxHealth);
        this.friendshipLevel = friendshipLevel;
    }
    public Pikachu(Pikachu p) {
        super(p);
        friendshipLevel = p.friendshipLevel;
    }
    public void heal(int amount) {
        super.heal(amount * 2);
    }
    public boolean equals(Object other) {
        //Pokemon.equals(other) use the equals method from parent class
        if (super.equals(other) && friendshipLevel == other.friendshipLevel) {
            return true;
        } else {
            return false;
        }
    }
    //todo: hashcode method


}
