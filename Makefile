NAME1		=	C/grace/

NAME2		=

NAME3		=

all	:
	cd $(NAME1) ; make ; cd ..
	#cd $(NAME2) ; make ; cd ..
	#cd $(NAME3) ; make ; cd ..

clean	:
	cd $(NAME1) ; make clean; cd ..
	#cd $(NAME2) ; make clean; cd ..
	#cd $(NAME3) ; make clean; cd ..

fclean	:
	cd $(NAME1) ; make fclean; cd ..
	#cd $(NAME2) ; make fclean; cd ..
	#cd $(NAME3) ; make fclean; cd ..

re	:
	cd $(NAME1) ; make re; cd ..
	#cd $(NAME2) ; make re; cd ..
	#cd $(NAME3) ; make re; cd ..

.PHONY	:	all clean fclean re
