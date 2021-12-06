//Azha Qari
//I worked on this assignment alone

public class Cheese {
    //Getters Needed:
    //Setters Needed:
    private String cheeseType;
    private int cheesePrice;
    private boolean isSentient;
    private int numTrades;
    private static int allTrades;


    public Cheese() {
        isSentient = false;
        numTrades = 0;
    }


    public Cheese(int cheesePrice, String cheeseType) {
        isSentient = false;
        numTrades = 0;

        this.cheesePrice = cheesePrice;
        this.cheeseType = cheeseType;
    }

    public Cheese(int cheesePrice, String cheeseType, int numTrades) {
        if (numTrades < 3) {
            isSentient = false;
        } else {
            isSentient = true;
        }

        this.cheesePrice = cheesePrice;
        this.cheeseType = cheeseType;
        this.numTrades = numTrades;
    }


    public String toString() {
        String x = "";
        if (isSentient == false) {
            x = "This is a slice of " + cheeseType + " cheese that has been traded " + numTrades + " times.";
        } else if (isSentient == true && numTrades >= 3) {
            x = "I am a slice of " + cheeseType + " that has been traded " + numTrades + " times.";
        }
        return x;
    }

    /**
     * equals method
     * @param cheeseType type of cheese
     * @param cheesePrice the price of cheese
     * @param isSentient if the cheese is sentient
     * @return equals
     */
    public boolean equals(String cheeseType, int cheesePrice, boolean isSentient) {
        return (this.cheeseType.equals(cheeseType)) && (this.cheesePrice == cheesePrice)
                && (this.isSentient == isSentient);
    }

    /**
     * Trading cheese
     * @param cheese cheese
     */
    public void cheeseTraded(Cheese cheese) {
        allTrades += 1;
        this.numTrades += 1;
        cheese.numTrades += 1;
        if (cheese.numTrades >= 3) {
            cheese.isSentient = true;
            cheese.cheesePrice *= 2;
            System.out.println("I'm ALIIIIIVE!");
        }
        if (this.numTrades >= 3) {
            this.isSentient = true;
            this.cheesePrice *= 2;
            System.out.println("I'm ALIIIIIVE!");
        }
    }

    /**
     * Getter for number of trades
     * @return numTrades
     */
    public int getNumTrades() {
        return numTrades;
    }

    /**
     * Getter for cheese price
     * @return cheesePrice
     */
    public int getCheesePrice() {
        return cheesePrice;
    }

    /**
     * Setter for sentience
     * @param bool sentience
     */
    public void setSentient(boolean bool)  {
        this.isSentient = bool;
    }

    public boolean getSentient() {
        return isSentient;
    }

}
