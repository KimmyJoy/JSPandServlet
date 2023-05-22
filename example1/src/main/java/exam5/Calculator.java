package exam5;

public class Calculator {

	public static double calculate(double operand1, double operand2, String operator) {
		double result = 0;

		if (operator.equals("+")) {
			result = operand1 + operand2;
		} else if (operator.equals("-")) {
			result = operand1 - operand2;
		} else if (operator.equals("*")) {
			result = operand1 * operand2;
		} else if (operator.equals("/")) {
			result = operand1 / operand2;
		}
			return result;
	}
}
