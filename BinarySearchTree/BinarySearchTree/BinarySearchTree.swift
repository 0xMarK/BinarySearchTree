//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by MarK on 14.11.2020.
//

import Foundation

class BinarySearchTree {
    
    private(set) var root: Node?
    
    func insert(_ value: Int) {
        guard let root = root else {
            self.root = Node(value)
            return
        }
        var currentNode: Node? = root
        while let current = currentNode {
            if current.value < value {
                if current.right == nil {
                    current.right = Node(value)
                    return
                } else {
                    currentNode = current.right
                }
            } else if current.value > value {
                if current.left == nil {
                    current.left = Node(value)
                    return
                } else {
                    currentNode = current.left
                }
            } else {
                return
            }
        }
    }
    
    func lookup(_ value: Int) -> Node? {
        guard let root = root else {
            return nil
        }
        if root.value == value {
            return root
        }
        var currentNode: Node? = root
        while let current = currentNode {
            if value < current.value {
                currentNode = current.left
            } else if value > current.value {
                currentNode = current.right
            } else {
                return current
            }
        }
        return nil
    }
    
    func remove(_ value: Int) {
        var prevNode: Node? = nil
        var currentNode: Node? = root
        while let current = currentNode {
            if value < current.value {
                prevNode = current
                currentNode = current.left
            } else if value > current.value {
                prevNode = current
                currentNode = current.right
            } else {
                // We've found the correct node
                let tuple = findSuccessor(of: current)
                if let successor = tuple.successor {
                    if tuple.parent?.value != current.value {
                        if tuple.parent?.left == successor {
                            tuple.parent?.left = nil
                        } else if tuple.parent?.right == successor {
                            tuple.parent?.right = nil
                        }
                    }
                    replace(current, with: successor, nodeParent: prevNode, newNodeParent: tuple.parent)
                } else {
                    if prevNode?.left == current {
                        prevNode?.left = nil
                    } else if prevNode?.right == current {
                        prevNode?.right = nil
                    } else {
                        root = nil
                    }
                }
                return
            }
        }
    }
    
    private func findSuccessor(of node: Node) -> (successor: Node?, parent: Node?) {
        var successor: Node?
        var parent: Node?
        if let rightNode = node.right {
            var prevNode: Node? = node
            var currentNode: Node? = rightNode
            while let current = currentNode {
                currentNode = current.left
                if let currentNode = currentNode {
                    parent = current
                    successor = currentNode
                } else {
                    parent = prevNode
                    successor = current
                }
                prevNode = current
            }
            return (successor: successor, parent: parent)
        } else {
            return (successor: node.left, parent: node.left == nil ? nil :  node)
        }
    }
    
    private func replace(_ node: Node, with newNode: Node, nodeParent: Node?, newNodeParent: Node?) {
        if nodeParent?.left == node {
            nodeParent?.left = newNode
        } else if nodeParent?.right == node {
            nodeParent?.right = newNode
        } else {
            root = newNode
        }
        if node.left == newNode {
            return
        }
        if let right = newNode.right,
           newNodeParent?.left == nil {
            newNodeParent?.left = right
        }
        newNode.left = node.left
        if node.right?.value != newNode.value {
            newNode.right = node.right
        }
    }
    
}
