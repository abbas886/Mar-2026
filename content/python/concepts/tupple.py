# branches in college
branches = ('cse', 'cse-it', 'it', 'cse-ds', 'cse-ai-ds')  
# tuple - ordered, immutable, allow duplicate values
print("Branches in college:", branches)
print("Type of branches variable:", type(branches))

# access elements using index
print("First branch:", branches[0])
print("Last branch:", branches[-1])
branches[0]="comuter science"  
#  tuples are immutable - can't modify existing element   
branches.append('ece')  
# can't add new element to tuple
# print("Branches after modification:", branches)
# concatenate two tuples
tupple1 = (10, 20, 30, 40, 50)
print("Original tupple1:", tupple1)
tupple2 = (60, 70)
new_tuple = tupple1 + tupple2
new_branches = branches + ('ece', 'mech')
all_branches = branches+new_branches
print("All branches after concatenation:", all_branches)