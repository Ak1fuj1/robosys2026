CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -lm
TARGET = o
SRCS = o.c
OBJS = $(SRCS:.c=.o)
all: $(TARGET)
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^
run: $(TARGET)
	./$(TARGET)
clean:
	rm -f $(TARGET) $(OBJS)
