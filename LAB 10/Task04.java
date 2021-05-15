import java.util.Scanner;

public class Task04 {
    static public int sum(int arr[]) {
        int sum = 0;
        for (int i = 0; i < arr.length; i++) {
            sum = sum + arr[i];
        }
        return sum;
    }

    static public double average(int arr[]) {
        double average = 0;
        for (int i = 0; i < arr.length; i++) {
            average = average + arr[i];
        }
        return average / arr.length;
    }

    static public int largest(int arr[]) {
        int largest = arr[0];
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] > largest) {
                largest = arr[i];
            }
        }
        return largest;
    }

    static public int smallest(int arr[]) {
        int smallest = arr[0];
        for (int i = 1; i < arr.length; i++) {
            if (arr[i] < smallest) {
                smallest = arr[i];
            }
        }
        return smallest;

    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int[] array = new int[10];
        System.out.print("Enter 10 numbers: ");
        for (int i = 0; i < 10; i++) {
            array[i] = input.nextInt();
        }
        System.out.println("Sum is: " + sum(array));
        System.out.println("Average is: " + average(array));
        System.out.println("Largest is: " + largest(array));
        System.out.println("Smallest is: " + smallest(array));
        input.close();
    }
}