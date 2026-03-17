import asyncio
import time

## block vs asyn
# block
def task():
    time.sleep(2)

for i in range(3):
    task()
# async
async def task():
    await asyncio.sleep(2)

async def main():
    await asyncio.gather(task(), task(), task())

asyncio.run(main())

async def hello():
    print("Hello")
    await asyncio.sleep(2)
    print("World")

asyncio.run(hello())

async def task(name):
    print(f"Task {name} started")
    await asyncio.sleep(2)
    print(f"Task {name} completed")

async def main():
    await asyncio.gather(
        task("A"),
        task("B"),
        task("C")
    )

asyncio.run(main())