CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra

SRC = \
    ast.cpp \
    pseudo_rvgen.cpp \
    dot_emitter.cpp \
    labeler.cpp \
    lexer.cpp \
    parser.cpp \
    pretty_print.cpp \
    symtab.cpp \
    cfg.cpp \
    cfg_dot.cpp \
    main.cpp

OBJ = $(SRC:.cpp=.o)
BIN = whilec

all: $(BIN)

$(BIN): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $(BIN) $(OBJ)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

clean:
	rm -f $(OBJ) $(BIN)
	rm -rf dotfiles assemblycode

.PHONY: all clean
