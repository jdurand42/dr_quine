s = "s = {1:c}{3}{1:c}{0:c}def f(s):{0:c}{2}file = open({1:c}Grace_kid.py{1:c}, {1:c}w+{1:c}){0:c}{2}file.write(s.format(10, 34, '	', s)){0:c}{2}file.close(){0:c}{0:c}f(s){0:c}# un commentaire{0:c}"
def f(s):
	file = open("Grace_kid.py", "w+")
	file.write(s.format(10, 34, '	', s))
	file.close()

f(s)
# un commentaire
