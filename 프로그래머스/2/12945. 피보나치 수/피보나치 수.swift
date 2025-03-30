func solution(_ n:Int) -> Int {
    var nums: Array = [0, 1]
    
    for i in 2...n {
        nums.append((nums[i-2] + nums[i-1]) % 1234567 )
    }
    
    return nums[n]
}