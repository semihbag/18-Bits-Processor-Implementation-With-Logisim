import java.io.File;
import java.io.PrintWriter;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		try {
			
			File inputFile = new File("input.txt");
			File outputFile = new File("output.hex");
			
			PrintWriter output = new PrintWriter(outputFile);

			Scanner scanner = new Scanner(inputFile);
			String currentLine = "";
			output.println("v2.0 raw");
			while (scanner.hasNextLine()) {
				currentLine = scanner.nextLine();
				output.println(Converter.AsbToHex(currentLine));
				
			}
			scanner.close();
			output.close();
		
		}
		catch (Exception e) {
			e.printStackTrace(System.out);
		}
	}
}
