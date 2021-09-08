NAME		=	Sully

SRCS	= Sully.c

RESULT_FILES = Sully_4.c Sully_3.c Sully_2.c Sully_1.c Sully_0.c

RESULT_EXECS = Sully_4 Sully_3 Sully_2 Sully_1 Sully_0

CC		=	gcc

SANI	=	-fsanitize=address -g3

CFLAGS	=	-Wall -Wextra -Werror

OBJS	=	$(SRCS:.c=.o)

RM		= rm -rf

DIFF = $(shell diff $(SRCS) $(TEST_FILE))

RES = "$(DIFF)"

GOOD = ""

all	:	$(NAME)

$(NAME): $(OBJS)
		$(CC) -o $(NAME) $(OBJS)

c	:
		$(CC) -o $(NAME) $(OBJS) $(SRCS)

s	:
		$(CC) -o $(NAME) $(SANI) $(SRCS)

w	:
		$(CC) -o $(NAME) $(CFLAGS) $(SRCS)

clean	:
		$(RM) $(OBJS)
		$(RM) $(RESULT_FILES)

fclean	:	clean
		$(RM) $(NAME)
		$(RM) $(RESULT_EXECS)

re	:	fclean all

run	: clean
		./$(NAME)

test	: run

.PHONY	:	clean fclean all c s w run test
