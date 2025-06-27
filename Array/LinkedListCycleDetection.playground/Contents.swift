//: ## 🧩 Find the Duplicate Number (LeetCode #287)
//:
/* Think of the array as a linked list:

Each index is a node.
The value at each index is the "next pointer".
Since there's a duplicate, at least two nodes point to the same node, forming a cycle — just like in the Floyd's Tortoise and Hare algorithm! */
//: ### 💡 Floyd's Tortoise and Hare (Cycle Detection)

func findDuplicate(_ nums: [Int]) -> Int {
    var slow = nums[0]
    var fast = nums[0]
    
    // Step 1: Find the intersection point in cycle
    repeat {
        slow = nums[slow]
        fast = nums[nums[fast]]
    } while slow != fast

    // Step 2: Find the entrance to the cycle (duplicate number)
    slow = nums[0]
    while slow != fast {
        slow = nums[slow]
        fast = nums[fast]
    }
    
    return slow
}

//: ✅ Test Cases
print(findDuplicate([1,3,4,2,2]))  // Output: 2
print(findDuplicate([3,1,3,4,2]))  // Output: 3

