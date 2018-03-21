/**
* 从数组中int[] numbers = {2, 7, 11, 15};->target = 26 -> [3, 4]
**/

import java.util.Arrays;
import java.util.HashMap;

public class twoSum {
	public static int[] twoSum_func(int[] numbers,int target) {
		int[] res = new int[2];
		HashMap<Integer, Integer> nums = new HashMap<Integer, Integer>();

		for (int i = 0; i < numbers.length; i++) {
			Integer a = nums.get(numbers[i]);
			if (a == null) {
				nums.put(numbers[i], i);
			}
			
			a = nums.get(target - numbers[i]);
			if (a != null && a < i) {
				res[0] = a + 1;
                res[1] = i + 1;
                break;
			}
		}
		return res;
	}

	public static void main(String[] args) {
		int[] numbers = {2, 7, 11, 15};
		int target = 26;
		int[] result = twoSum(numbers, target);
		System.out.println(Arrays.toString(result));
	}
}