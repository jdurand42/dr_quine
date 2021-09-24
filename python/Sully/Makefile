NAME		=	Sully.py

SRCS	= Sully.py

TEST_FILE = Sully.py

CC		=	python

RESULT_FILES = Sully_4.py Sully_3.py Sully_2.py Sully_1.py Sully_0.py


# SANI	=	-fsanitize=address -g3

# CFLAGS	=	-Wall -Wextra -Werror

# OBJS	=	$(SRCS:.c=.o)

RM		= rm -rf

RES = "$(DIFF)"

GOOD = ""

all	: run

clean	:
	$(RM) $(RESULT_FILES)

fclean	:	clean

re	:	fclean all

run	:
		$(CC) $(SRCS)

.PHONY	:	clean fclean all c s w run test
