#include "lexer.hpp"
#include <cstring>
#include <sstream>
#include <stdexcept>
#include <cctype>

namespace whilec
{

    const std::unordered_map<std::string, TokenType> Lexer::keywords_ = {
        {"if", TokenType::IF},
        {"then", TokenType::THEN},
        {"else", TokenType::ELSE},
        {"fi", TokenType::FI},
        {"while", TokenType::WHILE},
        {"do", TokenType::DO},
        {"od", TokenType::OD},
        {"skip", TokenType::SKIP},
        {"true", TokenType::TRUE},
        {"false", TokenType::FALSE},
        {"not", TokenType::NOT},
        {"and", TokenType::AND},
        {"or", TokenType::OR},
    };

    Lexer::Lexer(std::string src) : s_(std::move(src)) {}

    bool Lexer::match(const char *p)
    {
        size_t n = std::strlen(p);
        if (pos_ + (int)n <= (int)s_.size() && s_.compare(pos_, n, p) == 0)
        {
            pos_ += (int)n;
            return true;
        }
        return false;
    }

    Token Lexer::make(TokenType tp, std::string lx)
    {
        Token t;
        t.type = tp;
        t.lexeme = std::move(lx);
        t.line = line_;
        return t;
    }

    void Lexer::skipSpacesAndComments()
    {
        while (pos_ < (int)s_.size())
        {
            char c = s_[pos_];
            // whitespace
            if (c == ' ' || c == '\t' || c == '\r')
            {
                ++pos_;
                continue;
            }
            if (c == '\n')
            {
                ++pos_;
                ++line_;
                continue;
            }

            // line comment: --
            if (c == '-' && pos_ + 1 < (int)s_.size() && s_[pos_ + 1] == '-')
            {
                pos_ += 2;
                while (pos_ < (int)s_.size() && s_[pos_] != '\n')
                    ++pos_;
                continue;
            }
            // block comment: {- ... -}
            if (c == '{' && pos_ + 1 < (int)s_.size() && s_[pos_ + 1] == '-')
            {
                int startLine = line_;
                pos_ += 2;
                bool closed = false;
                while (pos_ < (int)s_.size())
                {
                    if (s_[pos_] == '\n')
                    {
                        ++line_;
                        ++pos_;
                        continue;
                    }
                    if (s_[pos_] == '-' && pos_ + 1 < (int)s_.size() && s_[pos_ + 1] == '}')
                    {
                        pos_ += 2;
                        closed = true;
                        break;
                    }
                    ++pos_;
                }
                if (!closed)
                {
                    std::ostringstream oss;
                    oss << "LEXICAL ERROR (line " << startLine << "): comment needs closing bracket \"-}\"";
                    throw std::runtime_error(oss.str());
                }
                continue;
            }
            break;
        }
    }

    Token Lexer::next()
    {
        skipSpacesAndComments();
        Token t;
        t.line = line_;
        if (pos_ >= (int)s_.size())
        {
            t.type = TokenType::END_OF_FILE;
            return t;
        }

        // Multi-char operators first
        if (match(":="))
            return make(TokenType::ASSIGN, ":=");
        if (match("<="))
            return make(TokenType::LEQ, "<=");
        if (match(">="))
            return make(TokenType::GEQ, ">=");

        // Single-char
        char c = s_[pos_];
        if (c == ';')
        {
            ++pos_;
            return make(TokenType::SEMI, ";");
        }
        if (c == '(')
        {
            ++pos_;
            return make(TokenType::LPAR, "(");
        }
        if (c == ')')
        {
            ++pos_;
            return make(TokenType::RPAR, ")");
        }
        if (c == '[')
        {
            ++pos_;
            return make(TokenType::LBRACK, "[");
        }
        if (c == ']')
        {
            ++pos_;
            return make(TokenType::RBRACK, "]");
        }
        if (c == '+')
        {
            ++pos_;
            return make(TokenType::PLUS, "+");
        }
        if (c == '-')
        {
            ++pos_;
            return make(TokenType::MINUS, "-");
        }
        if (c == '*')
        {
            ++pos_;
            return make(TokenType::MULTI, "*");
        }
        if (c == '=')
        {
            ++pos_;
            return make(TokenType::EQ, "=");
        }
        if (c == '<')
        {
            ++pos_;
            return make(TokenType::LT, "<");
        }
        if (c == '>')
        {
            ++pos_;
            return make(TokenType::GT, ">");
        }

        // Number
        if (std::isdigit((unsigned char)c))
        {
            int start = pos_;
            long long v = 0;
            while (pos_ < (int)s_.size() && std::isdigit((unsigned char)s_[pos_]))
            {
                v = v * 10 + (s_[pos_] - '0');
                ++pos_;
            }
            Token t = make(TokenType::NUM, s_.substr(start, pos_ - start));
            t.intValue = v;
            return t;
        }

        // Identifier / keyword
        if (std::isalpha((unsigned char)c))
        {
            int start = pos_;
            while (pos_ < (int)s_.size() && (std::isalnum((unsigned char)s_[pos_]) || s_[pos_] == '_' || s_[pos_] == '\''))
                ++pos_;
            std::string lex = s_.substr(start, pos_ - start);
            auto it = keywords_.find(lex);
            if (it != keywords_.end())
                return make(it->second, lex);
            Token t = make(TokenType::ID, lex);
            return t;
        }

        // Unknown char
        {
            std::string bad(1, s_[pos_]);
            ++pos_;
            Token t = make(TokenType::INVALID, bad);
            return t;
        }
    }

}
