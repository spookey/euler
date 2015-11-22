# include <stdio.h>
# include <stdlib.h>

double factorial(int n);
double calc(int n);

int main(int argc, char** argv)
{
	int limit = 100;

	if (argc > 1)
	{
		sscanf(argv[1], "%i", &limit);
	}
	printf("%.16f\n", calc(limit));

	return EXIT_SUCCESS;
}


double factorial(int n)
{
	double res = 1.;
	for (int i = 1; i <= n; i++)
	{
		res *= i;
	}
	return res;
}

double calc(int n)
{
	double res = 0.;
	for (int i = 0; i <= n; i++)
	{
		res += (1 / factorial(i));
	}
	return res;
}
