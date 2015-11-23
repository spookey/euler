#!/usr/bin/env ruby

def factorial(n)
  res = 1
  (1..n).each { |i|
    res *= i
  }
  res
end

def calc(n)
  res = 0
  (0..n).each { |i|
    res += (1.0 / factorial(i))
  }
  res
end

if __FILE__ == $0
  limit = 100

  limit = ARGV[0].chomp.to_i if ARGV.length > 0

  puts "%.16f" % [calc(limit)]
end
