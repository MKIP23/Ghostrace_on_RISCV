CC = gcc
CFLAGS = -O2 -pthread
INCLUDES = ./fr.h
ZICFLAG = -march=rv64gc_zicbom

EXECS = src src_counter
EXECS_ZICBOM = src_zicbom src_counter_zicbom

#to compile without Zicbom extension
all: $(EXECS)

#to compile with Zicbom extension
all_zicbom: $(EXECS_ZICBOM)

src: src_ghostrace.c $(INCLUDES)
	$(CC) $(CFLAGS) -o src_ghostrace src_ghostrace.c
	
src_counter: src_countermeasure_ghostrace.c $(INCLUDES)
	$(CC) $(CFLAGS) -o src_countermeasure_ghostrace src_countermeasure_ghostrace.c
	
src_zicbom: src_ghostrace.c $(INCLUDES)
	$(CC) $(ZICFLAG) $(CFLAGS) -o src_ghostrace src_ghostrace.c
	
src_counter_zicbom: src_countermeasure_ghostrace.c $(INCLUDES)
	$(CC) $(ZICFLAG) $(CFLAGS) -o src_countermeasure_ghostrace src_countermeasure_ghostrace.c

.PHONY: clean
clean:
	rm -f src_ghostrace src_countermeasure_ghostrace
