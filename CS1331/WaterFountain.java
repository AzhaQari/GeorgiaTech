//I worked alone on the HW with the help of my notes and practice code
/**
*@author Azha Qari
*@version 1.0
*/
public class WaterFountain {
    private String modelName;
    private boolean requiresMaintenance;
    private int cupsPoured;
    private static int totalWaterFountains;
    public static final String SOFTWARE_VERSION = "2.0.0";
    public WaterFountain(String modelName, int cupsPoured) {
        this.modelName = modelName;
        this.cupsPoured = cupsPoured;
        requiresMaintenance = false;
        totalWaterFountains++;
    }
    public void pourCup() {
        if (!requiresMaintenance) {
            cupsPoured++;
        }
    }
    public boolean equals(WaterFountain other) {
        return (this.modelName == other.modelName && this.cupsPoured == other.cupsPoured);
    }
    public String toString() {
        String retString = "";
        String retString2 = "";
        if (requiresMaintenance) {
            retString = modelName + " has poured " + cupsPoured;
            retString2 = retString + " cups, requires maintenance and is running version: " + SOFTWARE_VERSION;
        } else {
            retString = modelName + " has poured " + cupsPoured;
            retString2 = retString +  " cups, does not require maintenance and is running version: " + SOFTWARE_VERSION;
        }
        return retString2;
    }

}
