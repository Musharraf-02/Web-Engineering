import java.util.Scanner;

public class Task05 {
    static public String decodeString(String encodedString) {
        String decodedString = "";
        for (char i : encodedString.toCharArray()) {
            int decodedSingleCharacter = i + 5;
            if (i >= 'A' && i <= 'Z') {
                if (decodedSingleCharacter > 'Z') {
                    decodedSingleCharacter = decodedSingleCharacter - ('Z' - 'A' + 1);
                }
                decodedString += (char) decodedSingleCharacter;
            } else if ((i >= 'a' && i <= 'z')) {
                if (decodedSingleCharacter > 'z') {
                    decodedSingleCharacter = decodedSingleCharacter - ('z' - 'a' + 1);
                }
                decodedString += (char) decodedSingleCharacter;
            } else {
                decodedString += i;

            }
        }
        return decodedString;
    }

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String str;
        System.out.print("Enter the encoded string: ");
        str = input.nextLine();
        System.out.println("The decoded string is: " + decodeString(str));
        input.close();
    }
}