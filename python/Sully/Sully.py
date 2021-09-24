import os

s = "import os{0:c}{0:c}s = {1:c}{5}{1:c}{0:c}d = {4:d}{0:c}d -= 1{0:c}if d < 0:{0:c}	exit(){0:c}file = open({1:c}Sully_{2:c}{3:c}.py{1:c}.format(d), {1:c}w+{1:c}){0:c}file.write(s.format(10, 34, 123, 125, d, s)){0:c}file.close(){0:c}if d > 0:{0:c}	os.system({1:c}python Sully_{2:c}{3:c}.py{1:c}.format(d)){0:c}"
d = 5
d -= 1
if d < 0:
	exit()
file = open("Sully_{}.py".format(d), "w+")
file.write(s.format(10, 34, 123, 125, d, s))
file.close()
if d > 0:
	os.system("python Sully_{}.py".format(d))
