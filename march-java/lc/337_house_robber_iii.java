// 0ms / 100% / 41.8MB / 59.39%

class Solution {
  private int[] helper(TreeNode node) {
      if (null == node) return new int[] {0, 0};

      int[] left = helper(node.left);
      int[] right = helper(node.right);

      // could be improved by ensuring no more than 2 consecutive "0"s
      int exclusive = Math.max(
              Math.max(left[0] + right[0], left[1] + right[1]),
              Math.max(left[1] + right[0], left[0] + right[1]));
      int inclusive = node.val + left[0] + right[0];

      return new int[] {exclusive, inclusive};
  }

  public int rob(TreeNode root) {
      int[] res = helper(root);
      return Math.max(res[0], res[1]);
  }
}