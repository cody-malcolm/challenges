// 0ms / 100% / 40.7MB / 43.93%

class Solution {
  public int countOrders(int n) {
      long total = 1;
      int sumOfPrevWidths = 1;
      for (int i = 2; i <= n; i++) {
          sumOfPrevWidths += 4 * i - 3;
          total *= sumOfPrevWidths;
          total %= 1_000_000_007;
      }
      return (int) (total % 1_000_000_007);
  }
}