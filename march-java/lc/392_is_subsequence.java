class Solution {
    public static void main(String[] args) {
        boolean res = isSubsequence("abc", "ahbgdc");
        boolean res2 = isSubsequence("axc", "ahbgdc");
        boolean res3 = isSubsequence("", "ahbgdc");
        boolean res4 = isSubsequence("abc", "ab");
        System.out.println(res);
        System.out.println(res2);
        System.out.println(res3);
        System.out.println(res4);

    }

    private static boolean isSubsequence(String s, String t) {
        int current = -1;
        for (int i = 0; i < s.length(); i++) {
            current = t.indexOf(s.charAt(i), current + 1);
            if (current == -1) return false;
        }
        return true;
    }
}