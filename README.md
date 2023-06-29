# ft_printf

This project is a part of the curriculum at 42 school and involves creating a custom implementation of the `printf` function from the C standard library. The purpose of this project is to gain a deeper understanding of variadic functions and string formatting in C.

# Project Overview

The `ft_printf` function is used to print formatted output to the standard output stream. It takes a format string and a variable number of arguments and produces the desired output based on the format specifiers present in the format string.

# Features

The `ft_printf` function supports the following format specifiers:

- `%c` - Prints a single character.
- `%s` - Prints a string of characters.
- `%p` - Prints the memory address of a pointer.
- `%d` - Prints signed decimal integers.
- `%u` - Prints unsigned decimal integers.
- `%x` and `%X` - Prints hexadecimal integers (lowercase or uppercase).
- `%%` - Prints a literal '%' character.

# Usage

The `ft_printf` function is used in a similar way to the standard `printf` function. Here's an example:

```c
int main(void)
{
	ft_printf("Hello, %s! The answer is %d.\n", "world", 42);
	return (0);
}
```

To compile the project, run the following command:
``` shell
make
```
This code will output: Hello, world! The answer is 42.
