using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using InterviewTasks.Tasks.BalancedTree;

namespace InterviewTasks
{
    [TestClass]
    public class BalancedTreeTests
    {
        IBalancedTreeSolution _solutionSimple = new BalancedTreeSolution_Simple();
        IBalancedTreeSolution _solutionSmart = new BalancedTreeSolution_Smart();

        [TestMethod]
        public void Test_EmptyTree_IsBalanced()
        {
            var tree = Node.Create();
            Assert.IsTrue(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsTrue(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_OneNodeTree_IsBalanced()
        {
            var tree = Node.Create(10);
            Assert.IsTrue(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsTrue(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_SmallTree_IsBalanced()
        {
            var tree = Node.Create(10, 6);
            Assert.IsTrue(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsTrue(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_SmallTree2_IsBalanced()
        {
            var tree = Node.Create(10, 6, 12);
            Assert.IsTrue(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsTrue(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_StandartTree_IsBalanced()
        {
            var tree = Node.Create(10, 6, 12, 4, 11);
            Assert.IsTrue(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsTrue(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_StandartTree_IsNotBalanced()
        {
            var tree = Node.Create(10, 6, 12, 4, 11, 2);
            Assert.IsFalse(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsFalse(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_BigTree_IsBalanced()
        {
            var tree = Node.Create(10, 6, 12, 4, 11, 2, 8);
            Assert.IsTrue(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsTrue(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_BigTree_IsNotBalanced()
        {
            var tree = Node.Create(10, 6, 12, 4, 11, 2, 8, 1);
            Assert.IsFalse(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsFalse(_solutionSmart.CheckNodeIsBalanced(tree));
        }

        [TestMethod]
        public void Test_BigTree2_IsNotBalanced()
        {
            var tree = Node.Create(10, 6, 12, 4, 11, 2, 8, 5, 14, 16, 18);
            Assert.IsFalse(_solutionSimple.CheckNodeIsBalanced(tree));
            Assert.IsFalse(_solutionSmart.CheckNodeIsBalanced(tree));
        }
    }
}
