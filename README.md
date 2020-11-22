# BinarySearchTree in Swift

Current implementation was tested on:

```
          ______45_______
         /               \
     __35__             __65__
    /      \           /      \
  15        40        59       78
 /  \      /  \      /  \     /  \
7   19    38  42    50  61   72  81
```

Usage example:

```swift
let tree = BinarySearchTree()
tree.insert(45)

tree.insert(35)
tree.insert(65)

tree.insert(15)
tree.insert(40)
tree.insert(59)
tree.insert(78)

let node = tree.lookup(35)
print(node?.value as Any) // 35
print(node?.left?.value as Any) // 15

tree.remove(65)
tree.remove(45)

print(tree.root?.value as Any) // 59
```

