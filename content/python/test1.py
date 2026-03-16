def read_large_file(file_path):
        with open(file_path, "r") as file:
            for line in file:
                yield line

for line in read_large_file("assignment.md"):
        print(line.strip())