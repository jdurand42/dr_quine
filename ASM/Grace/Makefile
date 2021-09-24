NAME		=	Grace

SRCS	= Grace.s

TEST_FILE = Grace_kid.s

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
