import java.util.Scanner;

public class Task03 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int number;
        System.out.print("Enter integral value: ");
        number = input.nextInt();
        if (number > 0) {
            System.out.println("The entered integral value is positive.");
        } else if (number < 0) {
            System.out.println("The entered integral value is negative.");
        } else {
            System.out.println("The entered integral value is non-negative.");
        }
        input.close();
    }
}