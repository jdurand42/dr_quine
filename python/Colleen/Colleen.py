def f(s):
	# commentaire hors du main
	print(s.format(10, '	', 34, s))

# commentaire dans le main
s = "def f(s):{0:c}{1}# commentaire hors du main{0:c}{1}print(s.format(10, '	', 34, s)){0:c}{0:c}# commentaire dans le main{0:c}s = {2:c}{3}{2:c}{0:c}f(s)"
f(s)
