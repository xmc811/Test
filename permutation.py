

def gen_perm(perm, n):
    print("nest + 1")
    if len(perm) == n:
        print(perm)
        print("nest - 1")

    for k in range(n):
        print("A: k = " + str(k))
        print("A: perm = " + str(perm))
        if k not in perm:
            perm.append(k)
            print("B: k = " + str(k))
            print("B: perm = " + str(perm))
            gen_perm(perm, n)
            print("C: k = " + str(k))
            print("C: perm = " + str(perm))
            perm.pop()
            print(perm)
            print(k)

gen_perm(perm = [], n = 3)