# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: twang <twang@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/29 09:42:39 by twang             #+#    #+#              #
#    Updated: 2023/06/29 10:11:02 by twang            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include config/print.mk

.SILENT:

#--headers---------------------------------------------------------------------#

HEADERS	=	ft_printf.h

#--sources---------------------------------------------------------------------#

SOURCES		=	ft_printf.c

#--variables-------------------------------------------------------------------#

NAME		=	ft_printf
TWANG		=	\e]8;;https://profile.intra.42.fr/users/twang\a\e[34mtwang\e[34m\e]8;;\a

OBJ_DIR		=	.objs
LIBFT_DIR	=	libft

#--flags-----------------------------------------------------------------------#

CFLAGS		=	-Wall -Wextra -Werror -I $(LIBFT_DIR)

#--libs------------------------------------------------------------------------#

LIBFT	=	$(LIBFT_DIR)/libft.a

#--objects---------------------------------------------------------------------#

OBJECTS	=	$(addprefix $(OBJ_DIR)/, $(SOURCES:.c=.o))

#--global rules----------------------------------------------------------------#

.DEFAULT_GOAL = all

#--compilation rules-----------------------------------------------------------#

all:
	$(MAKE) header
	$(MAKE) -C ./libft
	$(MAKE) $(NAME) -j

$(NAME): $(OBJECTS) $(LIBFT)
	$(CC) $^ $(CFLAGS) $(LIBFT) -o $@
	$(PRINT_CREATING)

$(OBJ_DIR)/%.o: %.c $(HEADERS) 
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@
	$(PRINT_COMPILING)

#--lib-------------------------------------------------------------------------#

lib:
	$(MAKE) -C $(LIBFT_DIR)
	
#--print header----------------------------------------------------------------#

header:
	printf "\n${PURPLE}project:\t${END}${BLUE}ft_printf${END}\n"
	printf "${PURPLE}author:\t\t${END}${BLUE}${TWANG}${END}\n"
	printf "${PURPLE}compiler:\t${END}${BLUE}${CC}${END}\n"
	printf "${PURPLE}flags:\t\t${END}${BLUE}${CFLAGS}${END}\n"
	printf "              ____________________________\n\n"

#--re, clean & fclean----------------------------------------------------------#

re:
	clear
	$(MAKE) fclean
	$(MAKE) -j all

clean:
	$(MAKE) -C $(LIBFT_DIR) clean
	$(RM) -rf $(OBJECTS)
	$(PRINT_CLEAN)

fclean:
	clear
	$(MAKE) clean
	$(MAKE) -C $(LIBFT_DIR) fclean
	$(RM) $(NAME)
	$(PRINT_FCLEAN)

#--PHONY-----------------------------------------------------------------------#

.PHONY: all lib header re clean fclean
