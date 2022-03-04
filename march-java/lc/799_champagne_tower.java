// recursive with dp
// 5ms / 80.82% / 45.1MB / 51.60%

class Solution {
  private double excess(int poured, int row, int col, double[] dp, boolean[] checked) {
      if (col > row || col < 0) return 0;
      int index = row * (row + 1) / 2 + col;
      int mirrorIndex = row * (row + 1) / 2 + (row - col);
      if (checked[index]) return dp[index];

      double output;
      if (index == 0) {
          output = ((double) (poured - 1) / 2);
          if (output < 0) output = 0;
          dp[0] = output;
          checked[0] = true;
          return output;
      }

      double input = excess(poured, row - 1, col -1, dp, checked) + excess(poured, row - 1, col, dp, checked);

      output = (input - 1) / 2;
      if (output < 0) output = 0;

      dp[index] = output;
      checked[index] = true;
      dp[mirrorIndex] = output;
      checked[mirrorIndex] = true;

      return output;
  }

  public double champagneTower(int poured, int query_row, int query_glass) {
      if (query_row == 0) return poured > 1 ? 1 : poured;

      int matrixSize = (query_row + 1) * (query_row + 2) / 2;
      double[] dp = new double[matrixSize];
      boolean[] checked = new boolean[matrixSize];

      double output = excess(poured, query_row - 1, query_glass - 1, dp, checked) + excess(poured, query_row - 1, query_glass, dp, checked);

      return output > 1 ? 1 : output;
  }
}