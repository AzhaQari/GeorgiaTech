//I worked alone on the HW with the help of my notes and practice code
/**
*@author Azha Qari
*@version 1.0
*/

public class Bar {

    private String chocolateType;
    private int barLength;
    private int barWidth;
    /**
    *Creates class Bar
    * @param chocolateType type of chocolate bar
    * @param barLength length of bar
    * @param barWidth width of bar
    */
    public Bar(String chocolateType, int barLength, int barWidth) {
        this.chocolateType = chocolateType;
        this.barLength = barLength;
        this.barWidth = barWidth;
    }
    /**
    *calculates the perimeter of the bar
    * @return barLength times barWidth
    */
    public int getPerimeter() {
        int barPerimeter = (2 * barLength) + (2 * barWidth);
        return barPerimeter;
    }
    /**
    *calculates the area of the bar
    * @return barLength times barWidth
    */
    public int getArea() {
        int barArea = barLength * barWidth;
        return barArea;
    }
    /**
    *tests whether the bar is a Square
    * @return true if barLength == barWidth
    */
    public boolean isSquare() {
        boolean returnBool = barLength == barWidth ? true : false;
        return returnBool;
    }
    /**
    *calculates the cost of the bar
    *@param chocolateCost cost of chocolate per unit area
    *@param trimCost cost of trim
    *@return returns total cost of the bar
    */
    public double calculateCost(double chocolateCost, double trimCost) {
        int barPerimeter = (2 * barLength) + (2 * barWidth);
        int barArea = barLength * barWidth;
        double returnCost = (barArea * chocolateCost) + (barPerimeter * trimCost);
        return returnCost;
    }
    /**
    * displays the bar's dimensions or area
    * @return returns the dimensions or area
    */
    public String getDetails() {
        int barArea = barLength * barWidth;
        String returnSquare;
        String returnOther;
        if (barLength == barWidth) {
            returnSquare = "Square " + barArea + " piece bar of " + chocolateType + " chocolate";
            return returnSquare;
        } else {
            returnOther = barLength + " by " + barWidth + " bar of " + chocolateType + " chocolate";
            return returnOther;
        }
    }
    /**
    *this class prints an image of the bar with it's corresponding dimensions
    */
    public void drawBar() {
        String upperLet = this.chocolateType.toUpperCase().substring(0, 1);
        String toPrint = upperLet;
        int i = 0;
        int j = 1;
        while (i < barLength) {
            while (j < barWidth) {
                j++;
                toPrint += upperLet;
            }
            System.out.println(toPrint);
            toPrint = upperLet;
            i++;
            j = 1;

        }
    }

}
