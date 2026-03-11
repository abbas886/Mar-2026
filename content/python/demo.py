def message():
    return "hello";

def message(name):
    return "hello" + name;

def add(x,y):
    return x+y;

def big(x,y):
    if(x>y):
        return x;
    return y;

def grade(s1,s2,s3):
    if(s1<35 or s2<35 or s3<35):
        return "fail"
    avg = (s1+ s2 + s3) // 3
    if(avg>=60):
        return "first"
    if(avg>50):
        return "second"
    if(avg>=35):
        return "3rd class"
   
    

