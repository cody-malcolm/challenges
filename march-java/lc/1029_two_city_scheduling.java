// 2ms / 78.58% / 39.9MB / 93.45%

class Solution {
  public int twoCitySchedCost(int[][] costs) {
      int size = costs.length;
      int cutoff = size / 2;
      int first;
      int second;

      int[] counts = new int[2];

      int total = 0;

      // index 0 = difference, index 1 = 1 if second is smaller, else 0
      for (int i = 0; i < size; ++i) {
          first = costs[i][0];
          second = costs[i][1];
          costs[i][0] = Math.abs(first - second);
          if (second < first) {
              costs[i][1] = 1;
              total += second;
          } else {
              costs[i][1] = 0;
              total += first;
          }
      }

      Arrays.sort(costs, (a, b) -> b[0] - a[0]); // sort by differences (descending)

      for (int[] a : costs) {
          if (a[0] == 0) break; // if rest are 0, cost won't increase

          ++counts[a[1]];
          if (counts[a[1]] > cutoff) total += a[0];
      }

      return total;
  }
}