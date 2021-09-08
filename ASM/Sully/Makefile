NAME		= Sully

SRCS	= Sully.s

RESULT_FILES = Sully_4.s Sully_3.s Sully_2.s Sully_1.s Sully_0.s

RESULT_EXECS = Sully_4 Sully_3 Sully_2 Sully_1 Sully_0

TEST_FILE =

CC		=	nasm -f macho64

CC2		=	gcc

SANI	=	-fsanitize=address -g3

CFLAGS	=

OBJS	=	$(SRCS:.s=.o)

RM		= rm -rf

# DIFF = $(shell diff $(SRCS) $(TEST_FILE))

# RES = "$(DIFF)"

# GOOD = ""

%.o:%.s
		$(CC) $<

all	:	$(NAME)
		chmod +x $(NAME)

$(NAME): $(OBJS)
		$(CC2) -o $(NAME) $(OBJS)

clean	:
		$(RM) $(OBJS)
		$(RM) $(RESULT_FILES)

fclean	:	clean
		$(RM) $(NAME)
		$(RM) $(RESULT_EXECS)

re	:	fclean all

run	: clean
		./$(NAME)

.PHONY	:	clean fclean all c s w run test
