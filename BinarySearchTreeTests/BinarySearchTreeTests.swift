//
//  BinarySearchTreeTests.swift
//  BinarySearchTreeTests
//
//  Created by MarK on 14.11.2020.
//

import XCTest
@testable import BinarySearchTree

class BinarySearchTreeTests: XCTestCase {
    
    /// Generates a multilevel tree.
    ///
    ///               ______45_______
    ///              /               \
    ///          __35__             __65__
    ///         /      \           /      \
    ///       15        40        59       78
    ///      /  \      /  \      /  \     /  \
    ///     7   19    38  42    50  61   72  81
    ///
    /// - Parameter levels: Quantity of tree levels. Allowed values: 0...4
    /// - Returns: Multilevel tree
    private func generateTree(levels: Int) -> BinarySearchTree {
        let tree = BinarySearchTree()
        
        if levels > 0 {
            tree.insert(45)
        }
        
        if levels > 1 {
            tree.insert(35)
            tree.insert(65)
        }
        
        if levels > 2 {
            tree.insert(15)
            tree.insert(40)
            tree.insert(59)
            tree.insert(78)
        }
        
        if levels > 3 {
            tree.insert(7)
            tree.insert(19)
            tree.insert(38)
            tree.insert(42)
            tree.insert(50)
            tree.insert(61)
            tree.insert(72)
            tree.insert(81)
        }
        
        return tree
    }
    
    func testEmpty() throws {
        let tree = generateTree(levels: 0)
        XCTAssert(tree.root == nil)
        tree.remove(45)
        XCTAssert(tree.root == nil)
    }
    
    func testRoot() throws {
        let tree = generateTree(levels: 1)
        
        XCTAssert(tree.root != nil)
        
        XCTAssert(tree.root?.value == 45)
        
        XCTAssert(tree.root?.left == nil)
        XCTAssert(tree.root?.right == nil)
    }
    
    func testSecondLevel() throws {
        let tree = generateTree(levels: 2)
        
        XCTAssert(tree.root?.value == 45)
        
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 65)
        
        XCTAssert(tree.root?.left?.left == nil)
        XCTAssert(tree.root?.right?.right == nil)
    }
    
    func testThirdLevel() throws {
        let tree = generateTree(levels: 3)
        
        XCTAssert(tree.root?.value == 45)
        
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 65)
        
        XCTAssert(tree.root?.left?.left?.value == 15)
        XCTAssert(tree.root?.left?.right?.value == 40)
        XCTAssert(tree.root?.right?.left?.value == 59)
        XCTAssert(tree.root?.right?.right?.value == 78)
    }
    
    func testFourthLevel() throws {
        let tree = generateTree(levels: 4)
        
        XCTAssert(tree.root?.value == 45)
        
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 65)
        
        XCTAssert(tree.root?.left?.left?.value == 15)
        XCTAssert(tree.root?.left?.right?.value == 40)
        
        XCTAssert(tree.root?.right?.left?.value == 59)
        XCTAssert(tree.root?.right?.right?.value == 78)
        
        XCTAssert(tree.root?.left?.left?.left?.value == 7)
        XCTAssert(tree.root?.left?.left?.right?.value == 19)
        
        XCTAssert(tree.root?.left?.right?.left?.value == 38)
        XCTAssert(tree.root?.left?.right?.right?.value == 42)
        
        XCTAssert(tree.root?.right?.left?.left?.value == 50)
        XCTAssert(tree.root?.right?.left?.right?.value == 61)
        
        XCTAssert(tree.root?.right?.right?.left?.value == 72)
        XCTAssert(tree.root?.right?.right?.right?.value == 81)
    }
    
}

extension BinarySearchTreeTests {
    
    func testLookup() throws {
        let tree0 = generateTree(levels: 0)
        XCTAssert(tree0.lookup(45) == nil)
        
        let tree1 = generateTree(levels: 1)
        XCTAssert(tree1.lookup(45)?.value == 45)
        
        let tree2 = generateTree(levels: 2)
        XCTAssert(tree2.lookup(45)?.value == 45)
        XCTAssert(tree2.lookup(35)?.value == 35)
        XCTAssert(tree2.lookup(65)?.value == 65)
        
        let tree3 = generateTree(levels: 3)
        XCTAssert(tree3.lookup(45)?.value == 45)
        XCTAssert(tree3.lookup(35)?.value == 35)
        XCTAssert(tree3.lookup(65)?.value == 65)
        XCTAssert(tree3.lookup(15)?.value == 15)
        XCTAssert(tree3.lookup(40)?.value == 40)
        XCTAssert(tree3.lookup(59)?.value == 59)
        XCTAssert(tree3.lookup(78)?.value == 78)
        
        let tree4 = generateTree(levels: 4)
        XCTAssert(tree4.lookup(45)?.value == 45)
        XCTAssert(tree4.lookup(35)?.value == 35)
        XCTAssert(tree4.lookup(65)?.value == 65)
        XCTAssert(tree4.lookup(15)?.value == 15)
        XCTAssert(tree4.lookup(40)?.value == 40)
        XCTAssert(tree4.lookup(59)?.value == 59)
        XCTAssert(tree4.lookup(78)?.value == 78)
        XCTAssert(tree4.lookup(7)?.value == 7)
        XCTAssert(tree4.lookup(19)?.value == 19)
        XCTAssert(tree4.lookup(38)?.value == 38)
        XCTAssert(tree4.lookup(42)?.value == 42)
        XCTAssert(tree4.lookup(50)?.value == 50)
        XCTAssert(tree4.lookup(61)?.value == 61)
        XCTAssert(tree4.lookup(72)?.value == 72)
        XCTAssert(tree4.lookup(81)?.value == 81)
    }
    
}

extension BinarySearchTreeTests {
    
    func testRemoveEmpty() throws {
        let tree = generateTree(levels: 0)
        tree.remove(45)
        XCTAssert(tree.root == nil)
    }
    
    func testRemoveRoot() throws {
        let tree = generateTree(levels: 1)
        tree.remove(45)
        XCTAssert(tree.root == nil)
    }
    
    func testRemoveSecondLevel() throws {
        let tree = generateTree(levels: 2)
        tree.remove(35)
        XCTAssert(tree.root?.value == 45)
        XCTAssert(tree.root?.left?.value == nil)
        XCTAssert(tree.root?.right?.value == 65)
        tree.remove(65)
        XCTAssert(tree.root?.value == 45)
        XCTAssert(tree.root?.left?.value == nil)
        XCTAssert(tree.root?.right?.value == nil)
        tree.remove(45)
        XCTAssert(tree.root?.value == nil)
        XCTAssert(tree.root?.left?.value == nil)
        XCTAssert(tree.root?.right?.value == nil)
    }
    
    func testRemoveThirdLevel() throws {
        let tree = generateTree(levels: 3)
        
        tree.remove(15)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.left?.left?.value == nil)
        XCTAssert(tree.root?.left?.right?.value == 40)
        
        tree.remove(40)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.left?.right?.value == nil)
        
        tree.remove(35)
        XCTAssert(tree.root?.left == nil)
        
        tree.remove(65)
        XCTAssert(tree.root?.right?.value == 78)
        XCTAssert(tree.root?.right?.left?.value == 59)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(78)
        XCTAssert(tree.root?.right?.value == 59)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(59)
        XCTAssert(tree.root?.right == nil)
        
        tree.remove(45)
        XCTAssert(tree.root == nil)
    }
    
    func testRemoveFourthLevel() throws {
        let tree = generateTree(levels: 4)
        
        tree.remove(35)
        XCTAssert(tree.root?.left?.value == 38)
        XCTAssert(tree.root?.left?.left?.value == 15)
        XCTAssert(tree.root?.left?.right?.value == 40)
        XCTAssert(tree.root?.left?.right?.left == nil)
        XCTAssert(tree.root?.left?.right?.right?.value == 42)
        
        tree.remove(38)
        XCTAssert(tree.root?.left?.value == 40)
        XCTAssert(tree.root?.left?.right?.value == 42)
        
        tree.remove(40)
        XCTAssert(tree.root?.left?.value == 42)
        XCTAssert(tree.root?.left?.left?.value == 15)
        XCTAssert(tree.root?.left?.right == nil)
        
        tree.remove(42)
        XCTAssert(tree.root?.left?.value == 15)
        XCTAssert(tree.root?.left?.left?.value == 7)
        XCTAssert(tree.root?.left?.right?.value == 19)
        
        tree.remove(15)
        XCTAssert(tree.root?.left?.value == 19)
        XCTAssert(tree.root?.left?.left?.value == 7)
        XCTAssert(tree.root?.left?.right == nil)
        
        tree.remove(19)
        XCTAssert(tree.root?.left?.value == 7)
        XCTAssert(tree.root?.left?.left == nil)
        
        tree.remove(7)
        XCTAssert(tree.root?.left == nil)
        
        tree.remove(65)
        XCTAssert(tree.root?.right?.value == 72)
        XCTAssert(tree.root?.right?.left?.value == 59)
        XCTAssert(tree.root?.right?.right?.value == 78)
        XCTAssert(tree.root?.right?.right?.left == nil)
        XCTAssert(tree.root?.right?.right?.right?.value == 81)
        
        tree.remove(72)
        XCTAssert(tree.root?.right?.value == 78)
        XCTAssert(tree.root?.right?.right?.value == 81)
        XCTAssert(tree.root?.right?.left?.value == 59)
        
        tree.remove(78)
        XCTAssert(tree.root?.right?.value == 81)
        XCTAssert(tree.root?.right?.left?.value == 59)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(81)
        XCTAssert(tree.root?.right?.value == 59)
        XCTAssert(tree.root?.right?.left?.value == 50)
        XCTAssert(tree.root?.right?.right?.value == 61)
        
        tree.remove(59)
        XCTAssert(tree.root?.right?.value == 61)
        XCTAssert(tree.root?.right?.left?.value == 50)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(61)
        XCTAssert(tree.root?.right?.value == 50)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(50)
        XCTAssert(tree.root?.right == nil)
        
        tree.remove(45)
        XCTAssert(tree.root == nil)
    }
    
    func testFourthLevelRemoveRoot() throws {
        let tree = generateTree(levels: 4)
        
        tree.remove(45)
        XCTAssert(tree.root?.value == 50)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 65)
        XCTAssert(tree.root?.right?.left?.value == 59)
        XCTAssert(tree.root?.right?.left?.left == nil)
        XCTAssert(tree.root?.right?.left?.right?.value == 61)
        
        tree.remove(50)
        XCTAssert(tree.root?.value == 59)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 65)
        XCTAssert(tree.root?.right?.left?.value == 61)
        XCTAssert(tree.root?.right?.left?.left == nil)
        XCTAssert(tree.root?.right?.left?.right == nil)
        
        tree.remove(59)
        XCTAssert(tree.root?.value == 61)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 65)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right?.value == 78)
        
        tree.remove(61)
        XCTAssert(tree.root?.value == 65)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 78)
        XCTAssert(tree.root?.right?.left?.value == 72)
        XCTAssert(tree.root?.right?.right?.value == 81)
        
        tree.remove(65)
        XCTAssert(tree.root?.value == 72)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 78)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right?.value == 81)
        
        tree.remove(72)
        XCTAssert(tree.root?.value == 78)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right?.value == 81)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(78)
        XCTAssert(tree.root?.value == 81)
        XCTAssert(tree.root?.left?.value == 35)
        XCTAssert(tree.root?.right == nil)
        
        tree.remove(81)
        XCTAssert(tree.root?.value == 35)
        XCTAssert(tree.root?.left?.value == 15)
        XCTAssert(tree.root?.right?.value == 40)
        
        tree.remove(35)
        XCTAssert(tree.root?.value == 38)
        XCTAssert(tree.root?.left?.value == 15)
        XCTAssert(tree.root?.right?.value == 40)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right?.value == 42)
        
        tree.remove(38)
        XCTAssert(tree.root?.value == 40)
        XCTAssert(tree.root?.left?.value == 15)
        XCTAssert(tree.root?.right?.value == 42)
        XCTAssert(tree.root?.right?.left == nil)
        XCTAssert(tree.root?.right?.right == nil)
        
        tree.remove(40)
        XCTAssert(tree.root?.value == 42)
        XCTAssert(tree.root?.left?.value == 15)
        XCTAssert(tree.root?.right == nil)
        
        tree.remove(42)
        XCTAssert(tree.root?.value == 15)
        XCTAssert(tree.root?.left?.value == 7)
        XCTAssert(tree.root?.right?.value == 19)
        
        tree.remove(15)
        XCTAssert(tree.root?.value == 19)
        XCTAssert(tree.root?.left?.value == 7)
        XCTAssert(tree.root?.right == nil)
        
        tree.remove(19)
        XCTAssert(tree.root?.value == 7)
        XCTAssert(tree.root?.left == nil)
        XCTAssert(tree.root?.right == nil)
        
        tree.remove(7)
        XCTAssert(tree.root == nil)
    }
    
}
