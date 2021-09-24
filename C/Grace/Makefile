NAME		=	Grace

SRCS	= Grace.c

OUTPUT_FILE = Grace_kid.c

CC		=	gcc

SANI	=	-fsanitize=address -g3

CFLAGS	=	-Wall -Wextra -Werror

OBJS	=	$(SRCS:.c=.o)

RM		= rm -rf

DIFF = $(shell diff $(SRCS) $(OUTPUT_FILE))

RES = "$(DIFF)"

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
		$(RM) $(NAME) $(OUTPUT_FILE)

re	:	fclean all

run	: clean
		./$(NAME)

test	: run
ifeq ($(RES), "")
	@echo "Outputs are equals, SUCCESS";
else
	@echo "Outputs differs: ";
	@echo $(RES);
endif


.PHONY	:	clean fclean all c s w run test
