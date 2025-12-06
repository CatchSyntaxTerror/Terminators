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
    dead_code_elimination.cpp \
    main.cpp \
    register_allocation.cpp


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


# GoogleTest Make
# GTest directory
GTEST_DIR    := ../googletest/googletest
GTEST_INC    := $(GTEST_DIR)/include
GTEST_SRC    := $(GTEST_DIR)/src/gtest-all.cc

# Build directories for test code
GTEST_BUILD_DIR := gtest_build
GTEST_OBJS      := $(GTEST_BUILD_DIR)/gtest-all.o
GTEST_LIB       := $(GTEST_BUILD_DIR)/libgtest.a

TEST_SRCS := ../tests/auto_test.cpp
TEST_BIN  := ../tests/test_runner

# Remove main.o from object list when building tests  
NON_MAIN_OBJS := $(filter-out main.o, $(OBJ))

# Build gtest-all.o
$(GTEST_BUILD_DIR)/gtest-all.o: $(GTEST_SRC)
	@mkdir -p $(dir $@)
	$(CXX) -std=c++17 -I$(GTEST_INC) -I$(GTEST_DIR) -c $< -o $@

# Build libgtest.a
$(GTEST_LIB): $(GTEST_OBJS)
	@mkdir -p $(dir $@)
	ar rcs $@ $^

# Build test_runner
$(TEST_BIN): $(NON_MAIN_OBJS) $(TEST_SRCS) $(GTEST_LIB)
	$(CXX) $(CXXFLAGS) -I$(GTEST_INC) $(TEST_SRCS) $(NON_MAIN_OBJS) $(GTEST_LIB) -lpthread -o $(TEST_BIN)
	@echo "Test runner built: $(TEST_BIN)"

# Main test target
.PHONY: test
test: $(TEST_BIN)
	cd ../tests && ./test_runner

# Clean test files
.PHONY: clean-test
clean-test:
	rm -rf $(GTEST_BUILD_DIR) $(TEST_BIN)