// 214ms / 64.00% / 45.8MB / 72.00%

// Same solution without using DivRem took 320ms

public class Solution {
    public IList<IList<int>> ShiftGrid(int[][] grid, int k) {
        int m = grid.Length;
        int n = grid[0].Length;
        k %= (m * n);
        int start = (m * n) - k;
        
        IList<IList<int>> res = new List<IList<int>>();
        List<int> row;
        
        int r;
        int c;
        
        for (int i = 0; i < m; ++i) {
            row = new List<int>();
            for (int j = 0; j < n; ++j) {
                r = Math.DivRem((start + i * n + j) % (m * n), n, out c);
                row.Add(grid[r][c]);
            }
            res.Add(row);
        }
        return res;
    }
}