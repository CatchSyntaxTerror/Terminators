#pragma once
#include <string>

namespace whilec
{

    enum class TokenType
    {
        // identifiers & literals
        ID,
        NUM,
        // keywords
        IF,
        THEN,
        ELSE,
        FI,
        WHILE,
        DO,
        OD,
        SKIP,
        TRUE,
        FALSE,
        NOT,
        AND,
        OR,
        // symbols/operators
        ASSIGN, // :=
        SEMI,   // ;
        LPAR,
        RPAR, // ( )
        LBRACK,
        RBRACK, // [ ]
        PLUS,
        MINUS,
        MULTI, // + - *
        EQ,
        LT,
        GT,
        LEQ,
        GEQ, // = < > <= >=
        // end & invalid
        END_OF_FILE,
        INVALID
    };

    struct Token
    {
        TokenType type;
        std::string lexeme;
        long long intValue = 0;
        int line = 1;
    };

}
