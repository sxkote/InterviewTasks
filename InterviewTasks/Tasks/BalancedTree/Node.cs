using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InterviewTasks.Tasks.BalancedTree
{
    public class Node
    {
        public Node Left { get; private set; }
        public Node Right { get; private set; }
        public int Value { get; private set; }

        public Node(int value)
        {
            this.Value = value;
        }

        public Node Add(Node node)
        {
            if (node == null)
                return null;

            if (node.Value < this.Value)
            {
                if (this.Left == null)
                    this.Left = node;
                else
                    this.Left.Add(node);
            }
            else
            {
                if (this.Right == null)
                    this.Right = node;
                else
                    this.Right.Add(node);
            }

            return node;
        }

        public Node Add(int value)
        {
            return this.Add(new Node(value));
        }

        static public Node Create(params int[] values)
        {
            if (values == null || values.Length <= 0)
                return null;

            var result = new Node(values[0]);

            for (int i = 1; i < values.Length; i++)
                result.Add(values[i]);

            return result;
        }
    }
}
