// 220ms / 95.47% / 49.7MB / 6.89%;

// First C# program
// 220ms??? leetcode why

using System;

public class Solution {
    public void ReverseString(char[] s) {
        int lastIndex = s.Length - 1;
        char temp;
        for (int i = 0; i <= lastIndex / 2; ++i) {
          temp = s[i];
          s[i] = s[lastIndex - i];
          s[lastIndex - i] = temp;
        }
    }
}