// 92ms / 84.31% / 45.4MB / 14.0%
// I'm surprised the compiler didn't optimize out the recursion

public class Solution {    
    private bool Helper(string s, int l, int r) {
        while (l < r) {
            if (s[l] == s[r]) {
                ++l;
                --r;
            } else {
                return false;
            }
        }
        return true;
    }
    
    public bool ValidPalindrome(string s) {
        int l = 0;
        int r = s.Length - 1;
        
        while (l < r) {
            if (s[l] == s[r]) {
                ++l;
                --r;
            } else {
                return Helper(s, l + 1, r) || Helper(s, l, r - 1);
            }
        }
        return true;
    }
}

// 165ms / 14.42% / 43.1MB / 20.78%

public class Solution {    
    private bool Helper(string s, int l, int r, bool flag) {
        if (r <= l) return true;
        
        if (s[l] == s[r]) return Helper(s, l + 1, r - 1, flag);
        
        return flag && (Helper(s, l, r - 1, false) || Helper(s, l + 1, r, false));
    }
    
    public bool ValidPalindrome(string s) {
        return Helper(s, 0, s.Length - 1, true);
    }
}