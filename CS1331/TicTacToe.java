//Azha Qari
//I worked alone on this assignment with help from Shishir during office hours
import java.util.Scanner;
import java.util.Random;

public class TicTacToe {

    private static String p1 = "Player 1";
    private static String p2 = "Player 2";
    // Place your methods here
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int x = TicTacToe.getNumberPlayers(scan);
        if (x == 1) {
            TicTacToe.onePlayer();
        } else if (x == 2) {
            TicTacToe.twoPlayers();
        }
    }

    private static void onePlayer() {
        Board board = new Board();
        Random rand = new Random();
        int cpuRow;
        int cpuColumn;
        Scanner scan = new Scanner(System.in);
        System.out.println(board.toString());
        while (board.getGameState() == GameState.ONGOING) {
            while (board.getGameState() == GameState.ONGOING) {
                Location loc = TicTacToe.getInput(p1, scan);
                if (board.isValid(loc)) {
                    board.isSuccessful(loc, 'X');
                    System.out.println(board.toString());
                    break;
                } else {
                    continue;
                }
            }
            while (board.getGameState() == GameState.ONGOING) {
                cpuRow = rand.nextInt(3);
                cpuColumn = rand.nextInt(3);
                Location cpu = new Location(cpuRow, cpuColumn);
                if (board.isValid(cpu)) {
                    System.out.println("The Computer is making a move...");
                    board.isSuccessful(cpu, 'O');
                    System.out.println(board.toString());
                    break;
                } else {
                    continue;
                }
            }

            if (board.getGameState() == GameState.PLAYER1_WIN) {
                System.out.println("Player 1 Wins!");
                break;
            } else if (board.getGameState() == GameState.PLAYER2_WIN) {
                System.out.println("Player 2 Wins!");
                break;
            } else if (board.getGameState() == GameState.TIE) {
                System.out.println("It's a Tie!");
                break;
            }
        }

    }
    private static void twoPlayers() {
        Board board = new Board();
        Scanner scan = new Scanner(System.in);
        char player = '1';
        System.out.println(board.toString());
        while (board.getGameState() == GameState.ONGOING) {
            if (player == '1') {
                while (board.getGameState() == GameState.ONGOING) {
                    Location loc = TicTacToe.getInput(p1, scan);
                    if (board.isValid(loc)) {
                        board.isSuccessful(loc, 'X');
                        System.out.println(board.toString());
                        break;
                    } else {
                        continue;
                    }
                }
                player = '2';

            } else if (player == '2') {
                while (board.getGameState() == GameState.ONGOING) {
                    Location a = TicTacToe.getInput(p2, scan);
                    if (board.isValid(a)) {
                        board.isSuccessful(a, 'O');
                        System.out.println(board.toString());
                        break;
                    } else {
                        continue;
                    }
                }
                player = '1';
            }
            if (board.getGameState() == GameState.PLAYER1_WIN) {
                System.out.println("Player 1 Wins!");
                break;
            } else if (board.getGameState() == GameState.PLAYER2_WIN) {
                System.out.println("Player 2 Wins!");
                break;
            } else if (board.getGameState() == GameState.TIE) {
                System.out.println("It's a Tie!");
                break;
            }

        }
    }



    /********************************************************
     *                                                      *
     *      DO NOT MODIFY CODE BELOW THIS BOX               *
     *                                                      *
     ********************************************************/

   /**
     * Gets number of players from command line
     * @param sc        for reading from command-line
     * @return number of players (always 1 or 2)
     */
    private static int getNumberPlayers(Scanner sc) {
        boolean repeatPrompt = true;
        int numPlayers = 0;
        while (repeatPrompt) {
            System.out.print("How many players (1 or 2)? ");
            String input = sc.next();
            try {
                numPlayers = Integer.parseInt(input);
                if (numPlayers == 1 || numPlayers == 2) {
                    repeatPrompt = false;
                } else {
                    System.out.println("Enter 1 or 2 players.");
                }
            } catch (NumberFormatException e) {
                System.out.println("Please only enter a number.");
            }
        }
        return numPlayers;
    }

   /**
     * Handles scanner calls and user input
     * @param player    whose turn it is
     * @param sc        for reading from command-line
     * @return int[] holding row, column in that order
     */
    private static Location getInput(String player, Scanner sc) {
        boolean repeatPrompt = true;
        int row = -1;
        int col = -1;
        while (repeatPrompt) {
            System.out.print("Enter desired square for " + player + ": ");
            String input = sc.next();
            input = input.trim();
            String[] splitInput = input.split(",");
            try {
                row = Integer.parseInt(splitInput[0]);
                col = Integer.parseInt(splitInput[1]);
                repeatPrompt = false;
            } catch (NumberFormatException | IndexOutOfBoundsException e) {
                System.out.println("Please follow the format 'row,col'; for ex '1,2'");
            }
        }
        Location loc = new Location(row, col);
        return loc;
    }

}
