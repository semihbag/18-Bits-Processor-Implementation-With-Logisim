


public class Converter {

    public static String AsbToHex(String instruction) {

        String[] components = instruction.split(" ");
        String instr_Type = components[0];
        String binary = "";

        switch(instr_Type) {

            case "ADD", "AND","NAND","NOR":
                if(instr_Type.equals("ADD")) {
                    binary += "0000";
                }
                else if(instr_Type.equals("AND")) {
                    binary += "0001";
                }
                else if(instr_Type.equals("NAND")) {
                    binary += "0010";
                }
                else {
                    binary += "0011";
                }
                binary += decToBinary(components[1],4);
                binary += decToBinary(components[2],4);
                binary += "00";
                binary += decToBinary(components[3],4);
                break;
            
            case "ADDI","ANDI":
                if(instr_Type.equals("ADDI")) {
                    binary += "0100";
                }
                else {
                    binary += "0101";                    
                }
                binary += decToBinary(components[1],4);
                binary += decToBinary(components[2],4);
                binary += decToBinary(components[3],6);
                break;

            case "LD","ST":
                if(instr_Type.equals("LD")) {
                    binary += "0110";
                }
                else {
                    binary += "0111";                    
                }
                
                binary += decToBinary(components[1],4);
                binary += decToBinary(components[2],10);
                break;
            
            case "CMP":
                binary += "1000000000";
                binary += decToBinary(components[1],4);
                binary += decToBinary(components[2],4); 
                break;
                
            case "JUMP","JE","JA","JB","JAE","JBE":
                if(instr_Type.equals("JUMP")) {
                    binary += "10010000";
                }
                else if(instr_Type.equals("JE")) {
                    binary += "10100000";
                }
                else if(instr_Type.equals("JA")) {
                    binary += "10110000";
                }
                else if(instr_Type.equals("JB")) {
                    binary += "11000000";
                }
                else if(instr_Type.equals("JAE")) {
                    binary += "11010000";
                }
                else {
                    binary += "11100000";
                }

                binary += decToBinary(components[1], 10);
                break;
        }

        return binaryToHex(binary);
        
    }

    public  static String decToBinary(String component, int size) {
		
		// to get rid of R
		if (component.charAt(0) == 'R') {
			component = component.substring(1);
		}
		
		// convert string to int variable and convert it to binary
		int number = Integer.parseInt(component);
		String rowBinary = Integer.toBinaryString(number);
		
		
		if (number < 0) {
			return rowBinary.substring(rowBinary.length() - size);
		}
		else {
			while (rowBinary.length() < size) {
				rowBinary = "0" + rowBinary;
			}
			return rowBinary;
		}
	}

    public static String binaryToHex(String binary) {
        
        int decimal = Integer.parseInt(binary,2);
        String hexValue = Integer.toHexString(decimal);
        
        if (hexValue.length() != 5) {
        	while (hexValue.length() < 5) {
        		hexValue = "0" + hexValue;
			}
            return hexValue.toUpperCase();
        }
        else {
            return hexValue.toUpperCase();

		}
	}
 
}