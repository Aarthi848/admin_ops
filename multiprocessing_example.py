import multiprocessing
import time

def compute(n):
    result = sum(i*i for i in range(10_000_000))
    return f"Process {n}: {result}"

if __name__ == "__main__":
    with multiprocessing.Pool(4) as pool:
        results = pool.map(compute, range(4))
    
    for r in results:
        print(r)