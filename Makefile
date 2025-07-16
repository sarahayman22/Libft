CC = cc
CFLAGS = -Wall -Wextra -Werror

# libft sources
LIBFT_SRC = ft_bzero.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c \
ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_strchr.c ft_strlcpy.c \
ft_strlcat.c ft_strlen.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_tolower.c ft_toupper.c \
ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_itoa.c ft_split.c \
ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

LIBFT_OBJ = $(LIBFT_SRC:.c=.o)
LIBFT_NAME = libft.a

# ft_printf sources in subfolder
PRINTF_SRC = ft_printf/ft_printf.c ft_printf/ft_print_hex.c ft_printf/ft_print_ptr.c ft_printf/ft_strchr.c ft_printf/func.c
PRINTF_OBJ = $(PRINTF_SRC:.c=.o)
PRINTF_NAME = libftprintf.a

# Optional: your main program (if any)
MAIN = main.c


.PHONY: all clean fclean re

all: $(LIBFT_NAME) $(PRINTF_NAME) $(EXEC)

$(LIBFT_NAME): $(LIBFT_OBJ)
	ar rcs $@ $^

$(PRINTF_NAME): $(PRINTF_OBJ)
	ar rcs $@ $^

$(EXEC): $(MAIN) $(LIBFT_NAME) $(PRINTF_NAME)
	$(CC) $(CFLAGS) $(MAIN) -L. -lftprintf -lft -o $@

clean:
	rm -f $(LIBFT_OBJ) $(PRINTF_OBJ)

fclean: clean
	rm -f $(LIBFT_NAME) $(PRINTF_NAME) $(EXEC)

re: fclean all

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

