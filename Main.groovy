class Main
{
    static double factorial(int n)
    {
        double res = 1;
        n.times { res *= (it + 1) }
        return res
    }

    static double calc(int n)
    {
        double res = 0;
        (n + 1).times { res += (1/factorial(it)) }
        return res
    }


    static void main(String... args)
    {
        int limit = 100

        if (args.length > 0 && args[0].isInteger())
        {
            limit = args[0].toInteger()
        }

        println String.format('%.16f', calc(limit))
    }
}
