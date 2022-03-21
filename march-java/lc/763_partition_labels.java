// 5ms / 71.86% / 42.3MB / 67.48%

class Solution {
  public List<Integer> partitionLabels(String s) {
      List<Integer> solution = new ArrayList<>();
      int[] lasts = new int[26];
      int current;
      int partitionEnd;
      int partitionStart;

      for (int i = 0; i < s.length(); ++i) {
          current = s.charAt(i) - 97;
          lasts[current] = i;
      }

      partitionStart = 0;
      partitionEnd = lasts[s.charAt(0) - 97];

      for (int i = 0; i < s.length(); ++i) {
          if (partitionEnd == i) {
              solution.add(partitionEnd - partitionStart + 1);
              partitionStart = i + 1;
          } else {
              current = s.charAt(i) - 97;
              if (partitionStart == lasts[current]) {
                  solution.add(1);
                  partitionStart = i + 1;
              } else {
                  if (lasts[current] > partitionEnd) partitionEnd = lasts[current];
              }
          }
      }

      return solution;
  }
}