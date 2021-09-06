NAME		=	Colleen

SRCS	= Colleen.c

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

pretest:
		./$(NAME) > $(TEST_FILE)

test	: pretest
ifeq ($(RES), "")
	@echo "Outputs are equals, SUCCESS";
else
	@echo "Outputs differs: ";
	@echo $(RES);
endif

.PHONY	:	clean fclean all c s w run test
