
func factorial(n: Int) -> Double {
    var res: Double = 1
    for var i = 1; i <= n; ++i {
        res *= Double(i)
    }
    return res
}

func calc(n: Int) -> Double {
    var res: Double = 0
    for var i = 0; i <= n; ++i {
        res += (1/factorial(i))
    }
    return res
}

var limit: Int = 100

if (Process.arguments.count > 1) {
    if let a: String  = Process.arguments[1] {
        if let l: Int = Int(a) {
            limit = l
        }
    }
}

print(calc(limit))
