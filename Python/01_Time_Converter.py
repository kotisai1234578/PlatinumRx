m=int(input())
h=m//60
r=m%60
if h>1:
    print(f"{h} hrs {r} minutes")
elif h==1:
    print(f"{h} hr {r} minutes")
else:
    print(f"{r} minutes")
