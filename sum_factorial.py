

def sum_fact(n):

	if n == 1:
		return 1

	else:
		return (n + sum_fact(n-1))


print(sum_fact(200))