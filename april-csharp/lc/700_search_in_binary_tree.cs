// 126ms / 76.91% / 48.6MB / 8.23%

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public int val;
 *     public TreeNode left;
 *     public TreeNode right;
 *     public TreeNode(int val=0, TreeNode left=null, TreeNode right=null) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
public class Solution {
    private TreeNode helper(TreeNode node, int val) {
        if (null == node) return null;
        
        if (node.val == val) return node;
        
        return (node.val > val) ? helper(node.left, val) : helper(node.right, val);
    }
    
    public TreeNode SearchBST(TreeNode root, int val) {
        if (root.val == val) return root;
        return (root.val > val) ? helper(root.left, val) : helper(root.right, val);
    }
}