NAME		=	Grace_kid.py

SRCS	= Grace.py

TEST_FILE = Grace_kid.py

CC		=	python

# SANI	=	-fsanitize=address -g3

# CFLAGS	=	-Wall -Wextra -Werror

# OBJS	=	$(SRCS:.c=.o)

RM		= rm -rf

DIFF = $(shell diff $(SRCS) $(TEST_FILE))

RES = "$(DIFF)"

GOOD = ""

all	: run

clean	:
	$(RM) $(TEST_FILE)

fclean	:	clean

re	:	fclean all

run	:
		$(CC) $(SRCS)

test	: run
			echo $(DIFF)

.PHONY	:	clean fclean all c s w run test
