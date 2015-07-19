all: simple_demo ev_httpd
OBJ := ev_loop.o ev_io.o ev_timer.o
CC := gcc
DEBUG := -g -Wall
LFLAG := -lrt

ev_httpd: ev_httpd.o $(OBJ)
	$(CC) $(DEBUG) $< $(OBJ) -o $@ $(LFLAG)
simple_demo: demo.o $(OBJ)
	$(CC) $(DEBUG) $< $(OBJ) -o $@ $(LFLAG)

ev_httpd.o: ev_httpd.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<
demo.o: demo.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<

ev_loop.o: ev_loop.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<

ev_io.o: ev_io.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<
ev_timer.o: ev_timer.c ev_loop.h ev_type.h
	$(CC) $(DEBUG) -c $<

clean:
	rm *.o simple_demo ev_httpd -f
