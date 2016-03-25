using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterviewTasks.Tasks.BalancedTree
{
    public class BalancedTreeSolution_Simple : IBalancedTreeSolution
    {
        public bool CheckNodeIsBalanced(Node node)
        {
            if (node == null)
                return true;

            return CheckNodeIsBalanced(node.Left)
                && CheckNodeIsBalanced(node.Right)
                && Math.Abs(CalcNodeHeight(node.Left) - CalcNodeHeight(node.Right)) <= 1;
        }

        private int CalcNodeHeight(Node node)
        {
            if (node == null)
                return 0;

            var left = CalcNodeHeight(node.Left);
            var right = CalcNodeHeight(node.Right);

            return Math.Max(left, right) + 1;
        }
    }
}
