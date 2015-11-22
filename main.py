#!/usr/bin/env python3
from sys import argv


def factorial(n):
    res = 1
    for i in range(1, n+1):
        res *= i
    return res


def calc(n):
    res = 0
    for i in range(n+1):
        res += (1 / factorial(i))
    return res


if __name__ == '__main__':
    limit = 100
    try:
        limit = int(argv[-1])
    except ValueError:
        pass

    print('{:.16f}'.format(
        calc(limit)
    ))
