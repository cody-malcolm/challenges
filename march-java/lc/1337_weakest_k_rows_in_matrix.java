// 1ms / 99.77% / 49.1MB / 24.42%

class Solution {
  public int[] kWeakestRows(int[][] mat, int k) {
      int[] indices = new int[k];
      --k;
      int i = -1;
      int r = -1;
      int c = 0;
      int m = mat.length;
      int n = mat[0].length;
      while (i < k) {
          if (++r == m) {
              r = 0;
              ++c;
              if (c == n) {
                  r = -1;
                  --c;
                  while (i < k) {
                      if (mat[++r][c] == 1) indices[++i] = r;
                  }
                  return indices;
              }
          }
          if (mat[r][c] == 0 && (c == 0 || mat[r][c-1] == 1)) indices[++i] = r;
      }
      return indices;
  }
}