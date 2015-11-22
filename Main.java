public class Main
{

	public static double factorial(int n)
	{
		double res = 1.;
		for (int i = 1; i <= n; i++)
		{
			res *= i;
		}
		return res;
	}

	public static double calc(int n)
	{
		double res = 0.;
		for (int i = 0; i <= n; i++)
		{
			res += (1 / factorial(i));
		}
		return res;
	}

	public static void main(String[] args)
	{
		int limit = 100;

		if (args.length > 0)
		{
			try
			{
				limit = Integer.parseInt(args[0]);
			}
			catch (NumberFormatException e)
			{}
		}

		System.out.printf("%.16f\n", calc(limit));
	}

}
