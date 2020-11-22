//
//  BinarySearchTree.Node.swift
//  BinarySearchTree
//
//  Created by MarK on 14.11.2020.
//

import Foundation

extension BinarySearchTree {
    
    class Node {
        
        let value: Int
        var left: Node?
        var right: Node?
        
        init(_ value: Int) {
            self.value = value
        }
        
    }
    
}

extension BinarySearchTree.Node: Equatable {
    
    static func ==(lhs: BinarySearchTree.Node, rhs: BinarySearchTree.Node) -> Bool {
        return lhs.value == rhs.value
    }
    
}
