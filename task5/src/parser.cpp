#include "parser.hpp"
#include <sstream>
#include <stdexcept>

namespace whilec
{

    Parser::Parser(Lexer &lx) : lex_(lx) { advance(); }

    void Parser::advance() { cur_ = lex_.next(); }
    bool Parser::accept(TokenType t)
    {
        if (cur_.type == t)
        {
            advance();
            return true;
        }
        return false;
    }
    void Parser::expect(TokenType t)
    {
        if (!accept(t))
            error(std::string("expected token ") + tokenName(t) + ", got " + tokenName(cur_.type));
    }
    [[noreturn]] void Parser::error(const std::string &msg)
    {
        std::ostringstream oss;
        oss << "PARSE ERROR (line " << cur_.line << "): " << msg << " (lexeme='" << cur_.lexeme << "')";
        throw std::runtime_error(oss.str());
    }
    const char *Parser::tokenName(TokenType t)
    {
        switch (t)
        {
        case TokenType::ID:
            return "ID";
        case TokenType::NUM:
            return "NUM";
        case TokenType::IF:
            return "IF";
        case TokenType::THEN:
            return "THEN";
        case TokenType::ELSE:
            return "ELSE";
        case TokenType::FI:
            return "FI";
        case TokenType::WHILE:
            return "WHILE";
        case TokenType::DO:
            return "DO";
        case TokenType::OD:
            return "OD";
        case TokenType::SKIP:
            return "SKIP";
        case TokenType::TRUE:
            return "TRUE";
        case TokenType::FALSE:
            return "FALSE";
        case TokenType::NOT:
            return "NOT";
        case TokenType::AND:
            return "AND";
        case TokenType::OR:
            return "OR";
        case TokenType::ASSIGN:
            return "ASSIGN";
        case TokenType::SEMI:
            return "SEMI";
        case TokenType::LPAR:
            return "LPAR";
        case TokenType::RPAR:
            return "RPAR";
        case TokenType::LBRACK:
            return "LBRACK";
        case TokenType::RBRACK:
            return "RBRACK";
        case TokenType::PLUS:
            return "PLUS";
        case TokenType::MINUS:
            return "MINUS";
        case TokenType::MULTI:
            return "MULTI";
        case TokenType::EQ:
            return "EQ";
        case TokenType::LT:
            return "LT";
        case TokenType::GT:
            return "GT";
        case TokenType::LEQ:
            return "LEQ";
        case TokenType::GEQ:
            return "GEQ";
        case TokenType::END_OF_FILE:
            return "EOF";
        default:
            return "INVALID";
        }
    }

    // Program ::= Command
    std::unique_ptr<Program> Parser::parseProgram()
    {
        auto cmd = parseCommand();
        expect(TokenType::END_OF_FILE);
        return std::make_unique<Program>(std::move(cmd));
    }

    // Command ::= SimpleCommand (';' SimpleCommand)*
    std::unique_ptr<Node> Parser::parseCommand()
    {
        auto left = parseSimpleCommand();
        while (accept(TokenType::SEMI))
        {
            auto right = parseSimpleCommand();
            left = std::make_unique<Seq>(std::move(left), std::move(right));
        }
        return left;
    }

    // SimpleCommand
    std::unique_ptr<Node> Parser::parseSimpleCommand()
    {
        if (cur_.type == TokenType::ID)
        {
            std::string name = cur_.lexeme;
            advance();
            expect(TokenType::ASSIGN);
            auto expr = parseAExp();
            return std::make_unique<Assign>(name, std::move(expr));
        }
        if (accept(TokenType::SKIP))
        {
            return std::make_unique<Skip>();
        }
        if (accept(TokenType::IF))
        {
            auto cond = parseBExp();
            expect(TokenType::THEN);
            auto then_cmd = parseCommand();
            expect(TokenType::ELSE);
            auto else_cmd = parseCommand();
            expect(TokenType::FI);
            return std::make_unique<If>(std::move(cond), std::move(then_cmd), std::move(else_cmd));
        }
        if (accept(TokenType::WHILE))
        {
            auto cond = parseBExp();
            expect(TokenType::DO);
            auto body = parseCommand();
            expect(TokenType::OD);
            return std::make_unique<While>(std::move(cond), std::move(body));
        }
        error("expected SimpleCommand (ID/if/while/skip)");
    }

    // AExp -> AddExp
    std::unique_ptr<Node> Parser::parseAExp() { return parseAddExp(); }

    // AddExp : AddExp (+|-) MulExp | MulExp     (left-assoc)
    std::unique_ptr<Node> Parser::parseAddExp()
    {
        auto left = parseMulExp();
        while (cur_.type == TokenType::PLUS || cur_.type == TokenType::MINUS)
        {
            std::string op = (cur_.type == TokenType::PLUS ? "+" : "-");
            advance();
            auto right = parseMulExp();
            left = std::make_unique<ABin>(op, std::move(left), std::move(right));
        }
        return left;
    }

    // MulExp : MulExp * Atom | Atom             (left-assoc)
    std::unique_ptr<Node> Parser::parseMulExp()
    {
        auto left = parseAtom();
        while (cur_.type == TokenType::MULTI)
        {
            std::string op = "*";
            advance();
            auto right = parseAtom();
            left = std::make_unique<ABin>(op, std::move(left), std::move(right));
        }
        return left;
    }

    // Atom : '(' AExp ')' | ID | Integer
    std::unique_ptr<Node> Parser::parseAtom()
    {
        if (accept(TokenType::LPAR))
        {
            auto e = parseAExp();
            expect(TokenType::RPAR);
            return std::move(e);
        }
        if (cur_.type == TokenType::ID)
        {
            std::string name = cur_.lexeme;
            advance();
            return std::make_unique<Var>(name);
        }
        if (cur_.type == TokenType::NUM)
        {
            long long v = cur_.intValue;
            advance();
            return std::make_unique<Int>(v);
        }
        error("expected Atom '(' or ID or NUM");
    }

    // BExp -> OrExp
    std::unique_ptr<Node> Parser::parseBExp() { return parseOrExp(); }

    // OrExp : OrExp OR AndExp | AndExp
    std::unique_ptr<Node> Parser::parseOrExp()
    {
        auto left = parseAndExp();
        while (accept(TokenType::OR))
        {
            auto right = parseAndExp();
            left = std::make_unique<BBin>("or", std::move(left), std::move(right));
        }
        return left;
    }

    // AndExp : AndExp AND NotExp | NotExp
    std::unique_ptr<Node> Parser::parseAndExp()
    {
        auto left = parseNotExp();
        while (accept(TokenType::AND))
        {
            auto right = parseNotExp();
            left = std::make_unique<BBin>("and", std::move(left), std::move(right));
        }
        return left;
    }

    // Not / [ ] / Rel / true / false
    // NotExp : NOT '[' BExp ']' | '[' BExp ']' | RelExp | TRUE | FALSE
    std::unique_ptr<Node> Parser::parseNotExp()
    {
        if (accept(TokenType::NOT))
        {
            expect(TokenType::LBRACK);
            auto e = parseBExp();
            expect(TokenType::RBRACK);
            return std::make_unique<Not>(std::move(e));
        }
        if (accept(TokenType::LBRACK))
        {
            auto e = parseBExp();
            expect(TokenType::RBRACK);
            return e;
        }
        if (accept(TokenType::TRUE))
            return std::make_unique<Bool>(true);
        if (accept(TokenType::FALSE))
            return std::make_unique<Bool>(false);
        return parseRelExp();
    }

    // RelExp : AExp (=|<|<=|>|>=) AExp
    std::unique_ptr<Node> Parser::parseRelExp()
    {
        auto lhs = parseAExp();
        if (cur_.type == TokenType::EQ || cur_.type == TokenType::LT || cur_.type == TokenType::LEQ || cur_.type == TokenType::GT || cur_.type == TokenType::GEQ)
        {
            std::string op;
            switch (cur_.type)
            {
            case TokenType::EQ:
                op = "=";
                break;
            case TokenType::LT:
                op = "<";
                break;
            case TokenType::LEQ:
                op = "<=";
                break;
            case TokenType::GT:
                op = ">";
                break;
            case TokenType::GEQ:
                op = ">=";
                break;
            default:
                break;
            }
            advance();
            auto rhs = parseAExp();
            return std::make_unique<Rel>(op, std::move(lhs), std::move(rhs));
        }
        error("expected relational op (=,<,<=,>,>=) in boolean expression");
    }

}
