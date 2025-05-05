//: ## 6️⃣ Best Time to Buy and Sell Stock
//: - LeetCode #121
//: - You are given an array `prices` where `prices[i]` is the price of a given stock on the `i`-th day.
//: - You want to maximize your profit by choosing a single day to buy and a different day to sell.
//: - Return the maximum profit. If you can't achieve any profit, return 0.

func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = Int.max
    var maxProfit = 0

    for price in prices {
        if price < minPrice {
            minPrice = price
        } else {
            maxProfit = max(maxProfit, price - minPrice)
        }
    }

    return maxProfit
}

//: ✅ Test
print("Max Profit:", maxProfit([7,1,5,3,6,4])) // Output: 5
// Buy on day 2 (price = 1) and sell on day 5 (price = 6)

