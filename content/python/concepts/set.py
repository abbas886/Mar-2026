# college sports day example, football and valleyball participants
football = {'cse-101','cse-102','cse-105','cse-101'}  # set - no duplicate values
valleyball ={'cse-106','cse-107','cse-101'}
print("football participants:", football)
print("valleyball participants:", valleyball)

football.add('cse-108')  # add new participant
print("football participants after adding cse-108:", football)

football.remove('cse-102')  # remove participant
print("football participants after removing cse-102:", football)
#all_participants =  football+valleyball
#print("all participants (with duplicates):", all_participants)
all_participants_set = football.union(valleyball)  # union operation
print("all participants (set - no duplicates):", all_participants_set)

both_sports = football.intersection(valleyball)  # intersection operation
print("participants in both sports:", both_sports)

only_football = football.difference(valleyball)  # difference operation
print("participants only in football:", only_football)

only_valleyball = valleyball.difference(football)
print("participants only in valleyball:", only_valleyball)

# check membership
is_cse101_in_football = 'cse-101' in football
print("Is cse-101 in football participants?", is_cse101_in_football)

def check_participation(student_id):
    in_football = student_id in football
    in_valleyball = student_id in valleyball
    return in_football, in_valleyball

print(check_participation('cse-105'))
print(check_participation('cse-110'))
print("Total football participants:", len(football))
print("Total valleyball participants:", len(valleyball))
print("Total unique participants in both sports:", len(all_participants_set))