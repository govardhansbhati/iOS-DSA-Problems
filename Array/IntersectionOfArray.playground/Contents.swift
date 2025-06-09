//: ## 🔁 LeetCode #349: Intersection of Two Arrays
//:
//: ### 💡 Approach
//: - Convert both arrays to sets
//: - Use set intersection to get common unique elements

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let set1 = Set(nums1)
    let set2 = Set(nums2)
    return Array(set1.intersection(set2))
}

//: ✅ Test Cases
print(intersection([1,2,2,1], [2,2]))           // Output: [2]
print(intersection([4,9,5], [9,4,9,8,4]))       // Output: [4,9] or [9,4]

