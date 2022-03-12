// 2ms / 47.25% / 64.4MB / 35.92%

class Solution {
  public void rotate(int[] nums, int k) {
      int j = k % nums.length;
      if (j == 0) return;        
      int[] rotated = new int[j];
      int idx = 0;
      for (int i = nums.length - j; i < nums.length; i++) {
          rotated[idx++] = nums[i];
      }
      for (int i = nums.length - 1; i - j >= 0; i--) {
          nums[i] = nums[i - j];
      }
      for (int i = 0; i < j; i++) {
          nums[i] = rotated[i];
      }
  }
}