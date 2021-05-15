import java.util.Scanner;

public class Task02 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String name, genre;
        int year;
        double length;
        System.out.print("Movie Name: ");
        name = input.nextLine();
        System.out.print("Movie Genre: ");
        genre = input.nextLine();
        System.out.print("Movie Year: ");
        year = input.nextInt();
        System.out.print("Movie Length: ");
        length = input.nextDouble();
        System.out.println("\n\rDisplaying data...");
        System.out.println("\n\rName Entered: " + name);
        System.out.println("Genre Entered: " + genre);
        System.out.println("Year Entered: " + year);
        System.out.println("Length Entered: " + length);
        input.close();
    }
}