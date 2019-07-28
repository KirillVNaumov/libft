# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: knaumov <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/09/10 09:50:35 by knaumov           #+#    #+#              #
#    Updated: 2019/05/06 12:32:42 by knaumov          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CLEAR_LINE	= \033[2K
BEGIN_LINE	= \033[A
COL_END		= \033[0m
COL_RED		= \033[1;31m
COL_GREEN	= \033[1;32m
COL_YELLOW	= \033[1;33m
COL_BLUE	= \033[1;34m
COL_VIOLET	= \033[1;35m
COL_CYAN	= \033[1;36m
COL_WHITE	= \033[1;37m

NAME := libft.a
FILES := ./ft_atoi.c \
		./ft_abs.c \
		./ft_bzero.c \
		./ft_memdel_arlen.c \
		./ft_isspace.c \
		./ft_isalnum.c \
		./ft_isalpha.c \
		./ft_isascii.c \
		./ft_isdigit.c \
		./ft_isprint.c \
		./ft_itoa.c \
		./ft_memalloc.c \
		./ft_memccpy.c \
		./ft_memchr.c \
		./ft_memcmp.c \
		./ft_memcpy.c \
		./ft_memdel.c \
		./ft_memmove.c \
		./ft_memset.c \
		./ft_putchar.c \
		./ft_putchar_fd.c \
		./ft_putendl.c \
		./ft_putendl_fd.c \
		./ft_putnbr.c \
		./ft_putnbr_fd.c \
		./ft_putstr.c \
		./ft_putstr_fd.c \
		./ft_strcat.c \
		./ft_strsch.c \
		./ft_strchr.c \
		./ft_strclr.c \
		./ft_strcmp.c \
		./ft_strcpy.c \
		./ft_strdel.c \
		./ft_strdup.c \
		./ft_strequ.c \
		./ft_striter.c \
		./ft_striteri.c \
		./ft_strjoin.c \
		./ft_strlcat.c \
		./ft_strlen.c \
		./ft_strmap.c \
		./ft_strmapi.c \
		./ft_strncat.c \
		./ft_strncmp.c \
		./ft_strncpy.c \
		./ft_strnequ.c \
		./ft_strnew.c \
		./ft_strnstr.c \
		./ft_strrchr.c \
		./ft_strsplit.c \
		./ft_strstr.c \
		./ft_strsub.c \
		./ft_strtrim.c \
		./ft_tolower.c \
		./ft_toupper.c \
		./ft_itoa_base.c \
		./get_next_line.c \
		./ft_putunsignedint.c \
		./ft_strccrt.c \
		./ft_bchar.c \
		./ft_update.c \
		./ft_strtoupper.c \
		./ft_strtolower.c \
		./ft_putwchar.c \
		./ft_putwchar_fd.c \
		./ft_putwstr.c \
		./ft_putwstr_fd.c \
		./ft_wstrlen.c \
		./ft_wstrdup.c \
		./ft_wchrlen.c \
		./ft_strcon.c \
		./ft_clean_arr.c \
		./ft_create_arr.c \
		./ft_clean_int_arr.c \
		./error.c \
		./adding_minus.c \
		./adding_plus.c \
		./adding_precision_number.c \
		./adding_precision_string.c \
		./adding_space.c \
		./adding_width.c \
		./adding_width_null_char.c \
		./conversion_b.c \
		./conversion_c.c \
		./conversion_d_i.c \
		./conversion_o_cap_o.c \
		./conversion_p.c \
		./conversion_s.c \
		./conversion_u_cap_d_cap_u.c \
		./conversion_wide_c.c \
		./conversion_wide_s.c \
		./conversion_x_cap_x.c \
		./conversions.c \
		./ft_itoa_base_unsigned.c \
		./ft_itoa_intmax.c \
		./ft_itoa_unsigned.c \
		./ft_printf.c \
		./handle_flags.c \
		./handle_format.c \
		./handle_precision.c \
		./handle_width.c \
		./parse_flags.c \
		./printing_wide_string.c

OBJ := 	$(FILES:.c=.o)

PWD :=		$(shell pwd)

OBJDIR := 	obj

OBJP :=		$(addprefix $(OBJDIR)/, $(FILES:.c=.o))
ONLYDIR :=	$(foreach dir, $(OBJP), $(shell dirname $(dir)))

FLAG := -Wall -Wextra -Werror -g

TOTAL_FILES := $(shell echo $(FILES) | wc -w | sed -e 's/ //g')
CURRENT_FILES = $(shell ls $(PWD)/obj/ 2> /dev/null | wc -l | sed -e 's/ //g')

all : $(NAME)

$(NAME) : $(OBJP)
			@ar rc $(NAME) $(OBJP)
			@echo "$(CLEAR_LINE)$(COL_BLUE)[$(NAME)] $(COL_YELLOW)Finished compilation. Output file : $(COL_VIOLET)$(PWD)/$(NAME)$(COL_END)"

$(OBJDIR)/%.o: %.c libft.h ft_printf.h
			@mkdir -p $(ONLYDIR)
			@gcc -c $(FLAG) $< -o $@
			@echo "$(CLEAR_LINE)$(COL_BLUE)[$(NAME)] $(COL_YELLOW)Compiling file [$(COL_VIOLET)$<$(COL_YELLOW)]. ($(CURRENT_FILES) / $(TOTAL_FILES))$(COL_END)$(BEGIN_LINE)"

clean :
			@if [ -d "$(OBJDIR)" ]; then /bin/rm -rf $(OBJDIR); \
			fi
			@echo "$(COL_BLUE)[$(NAME)] $(COL_YELLOW)Removed $(COL_VIOLET)compiled objects.$(COL_END)";

fclean :	clean
			@if [ -a "$(NAME)" ]; then /bin/rm -f $(NAME); \
			fi
			@echo "$(COL_BLUE)[$(NAME)] $(COL_YELLOW)Removed $(COL_VIOLET)$(NAME)$(COL_END)";
			
re :		fclean all