NAME		=	Sully

SRCS	= Sully.c

TEST_FILE = test.c

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

fclean	:	clean
		$(RM) $(NAME)

re	:	fclean all

run	: clean
		./$(NAME)

test	: run

.PHONY	:	clean fclean all c s w run test
