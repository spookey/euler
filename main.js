#!/usr/bin/env node

var factorial = function(n)
{
    var res = 1;
    for (var i = 1; i <= n; i++)
    {
        res *= i;
    }
    return res
};

var calc = function(n)
{
    var res = 0.0;
    for (var i = 0; i <= n; i++)
    {
        res += (1 / factorial(i));
    }
    return res
}

var limit = 100;

if (process.argv.length > 2)
{
    var l = process.argv[2];
    if (parseInt(l, 10)) { limit = l; }
}

console.log(
    parseFloat(calc(limit)).toFixed(16)
);
