import java.util.Scanner;

public class InputHandler {
    //Opretter en scanner som hedder scanner.
    Scanner scanner;

    InputHandler(){
        scanner = new Scanner(System.in);
    }

    /**
     * Laver en metode der tager en String input fra tastaturet.
     * @return Når scanneren modtager input går den vidre til næste linje.
     */
    public String readString() {
        scanner = new Scanner(System.in);
        //Læser en string (returnere sig selv hvis der er er fejl)
        return scanner.nextLine();
    }

    /**
     * Laver en metode der tager en Int input fra tastaturet.
     * @return Når scanneren modtager input går den vidre til næste linje.
     */
    public int readInt() {
        // wait for integer input
        while(!scanner.hasNextInt()) {
            scanner.next();
        }
        return scanner.nextInt();
    }
}