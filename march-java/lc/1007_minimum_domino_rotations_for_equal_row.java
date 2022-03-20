// 4ms / 90.54% / 87.9MB

class Solution {
  public int minDominoRotations(int[] tops, int[] bottoms) {
      int[] topCounts = { 0, 0, 0, 0, 0, 0, 0};
      int[] botCounts = { 0, 0, 0, 0, 0, 0, 0};
      int[] doubleCounts = { 0, 0, 0, 0, 0, 0, 0};
      int top;
      int bot;
      
      for (int i = 0; i < tops.length; ++i) {
          top = tops[i];
          bot = bottoms[i];
          
          ++topCounts[top];
          ++botCounts[bot];
          if (top == bot) ++doubleCounts[top];
      }
      
      for (int i = 1; i <= 6; ++i) {
          if (topCounts[i] + botCounts[i] - doubleCounts[i] >= tops.length) {
              if (topCounts[i] < botCounts[i]) {
                  return topCounts[i] - doubleCounts[i];
              } else {
                  return botCounts[i] - doubleCounts[i];
              }
          }
      }
      return -1;
  }
}