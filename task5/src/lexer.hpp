#pragma once
#include "tokens.hpp"
#include <string>
#include <unordered_map>

namespace whilec
{

    class Lexer
    {
    public:
        explicit Lexer(std::string src);
        Token next();
        int currentLine() const { return line_; }

    private:
        std::string s_;
        int pos_ = 0;
        int line_ = 1;

        static const std::unordered_map<std::string, TokenType> keywords_;

        bool match(const char *p);
        Token make(TokenType tp, std::string lx);
        void skipSpacesAndComments();
    };

}