// 5ms / 85.04% / 43.5MB / 56.27%

class Solution {
    public String simplifyPath(String path) {
        Stack stack = new Stack();

        int start = 0;
        int end;
        String s;

        while ((end = path.indexOf('/', start)) >= 0) {
            s = path.substring(start, end);

            if (s.equals("..") && (!stack.empty())) {
                stack.pop();
            } else if (s.equals(".") || s.equals("..") || s.equals("")) {
                // do nothing
                // semantically pleasing and faster to execute on typical input compared with !(condition)
            } else {
                stack.push(s);
            }
            start = end + 1;
        }

        s = path.substring(start);

        if (s.equals("..") && (!stack.empty())) {
            stack.pop();
        } else if (s.equals(".") || s.equals("..") || s.equals("")) {
            // do nothing
        } else {
            stack.push(s);
        }

        if (stack.empty()) return "/";

        StringBuilder builder = new StringBuilder();
        while (!stack.empty()) {
            builder.insert(0, stack.pop()).insert(0, "/");
        }
        return builder.toString();
    }
}