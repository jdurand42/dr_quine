NAME		=	Colleen

SRCS	= Colleen.py

TEST_FILE = test.py

CC		=	python

# SANI	=	-fsanitize=address -g3

# CFLAGS	=	-Wall -Wextra -Werror

# OBJS	=	$(SRCS:.c=.o)

# RM		= rm -rf

DIFF = $(shell diff $(SRCS) $(TEST_FILE))

RES = "$(DIFF)"

GOOD = ""

all	: run

clean	:

fclean	:	clean

re	:	fclean all

run	:
		$(CC) $(SRCS)

pretest:
		$(CC) $(SRCS) > $(TEST_FILE)

test	: pretest
ifeq ($(RES), "")
	@echo "Outputs are equals, SUCCESS";
else
	@echo "Outputs differs: ";
	@echo $(RES);
endif

.PHONY	:	clean fclean all c s w run test
