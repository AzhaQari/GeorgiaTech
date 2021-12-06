public class Charmander extends Pokemon {
    private int flameLevel;
    public Charmander(String trainerName, int health, int maxHealth, int flameLevel) {
        super(trainerName, health, maxHealth);
        this.flameLevel = flameLevel;
    }
    public Charmander(Charmander c) {
        super(c);
        flameLevel = c.flameLevel;
    }
    public boolean equals(Object other) {

    }
    public void damage(int amount, boolean isWaterDamage) {
        if (isWaterDamage == false && health >= amount) {
            health -= amount;
            //append (-1 * amount) to medicalHistory
        } else if ()
    }
}



• void damage(int amount, boolean isWaterDamage) decrease health by amount if it is not water
damage. if it is water damage, decrease health by twice the amount. Health cannot go below 0. In
cases where health falls below 0, set health to 0 and update medicalHistory with only the amount of
health lost; for example, if a pokemon has 3 health and takes 4 damage, you would append -3 to its
medicalHistory. Make sure to update medicalHistory accordingly and reuse code wherever possible!
