#pragma once
#include "ast.hpp"
#include "lexer.hpp"
#include <memory>
#include <string>

namespace whilec
{

    class Parser
    {
    public:
        explicit Parser(Lexer &lx);
        std::unique_ptr<Program> parseProgram();

    private:
        Lexer &lex_;
        Token cur_;

        // utilities
        void advance();
        bool accept(TokenType t);
        void expect(TokenType t);
        [[noreturn]] void error(const std::string &msg);
        static const char *tokenName(TokenType t);

        // grammar
        std::unique_ptr<Node> parseCommand();
        std::unique_ptr<Node> parseSimpleCommand();
        std::unique_ptr<Node> parseAExp();
        std::unique_ptr<Node> parseAddExp();
        std::unique_ptr<Node> parseMulExp();
        std::unique_ptr<Node> parseAtom();
        std::unique_ptr<Node> parseBExp();
        std::unique_ptr<Node> parseOrExp();
        std::unique_ptr<Node> parseAndExp();
        std::unique_ptr<Node> parseNotExp();
        std::unique_ptr<Node> parseRelExp();
    };

}
