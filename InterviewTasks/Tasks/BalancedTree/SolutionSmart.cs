using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterviewTasks.Tasks.BalancedTree
{
    public class BalancedTreeSolution_Smart : IBalancedTreeSolution
    {
        public struct NodeBalance
        {
            public int Height { get; private set; }
            public bool Balance { get; private set; }
 
            public NodeBalance(int height, bool balance)
            {
                Height = height;
                Balance = balance;
            }
        }

        private NodeBalance CalcNodeBalance(Node node)
        {
            if (node == null)
                return new NodeBalance(0, true);

            var left = CalcNodeBalance(node.Left);
            var right = CalcNodeBalance(node.Right);

            var height = Math.Max(left.Height, right.Height) + 1;
            var balance = left.Balance && right.Balance && Math.Abs(left.Height - right.Height) <= 1;

            return new NodeBalance(height, balance);
        }

        public bool CheckNodeIsBalanced(Node node)
        {
            return CalcNodeBalance(node).Balance;
        }
    }
}
