#include <iostream>
#include <fstream>
#include <cctype>
#include <unordered_map>
#include <vector>
using namespace std;
/**
 * This is the scanner. It takes a while file and produces a list of tokens
 * Author: Youssef Amin
 */

// these are the tokens.
// It made more sense to me to use an enum than a struct
enum Tokens
{
    TRUE,
    FALSE,
    IF,
    THEN,
    ELSE,
    FI,
    WHILE,
    DO,
    OD,
    SKIP,
    NOT,
    AND,
    OR,
    ID,
    NUM,
    LPAR,
    RPAR,
    LBRACK,
    RBRACK,
    PLUS,
    MINUS,
    MULTI,
    EQ,
    LT,
    GT,
    LEQ,
    GEQ,
    ASSIGN,
    SEMI,
    END
};

// 1) keywords
static const unordered_map<string, Tokens> keywords = {
    {"if", IF}, {"then", THEN}, {"else", ELSE}, {"fi", FI}, 
    {"while", WHILE}, {"do", DO}, {"od", OD}, {"skip", SKIP}, 
    {"not", NOT}, {"and", AND}, {"or", OR}, {"true", TRUE}, {"false", FALSE}
};

// 2) two char ops
static const unordered_map<string, Tokens> two_chars = {
    {":=", ASSIGN}, {"<=", LEQ}, {">=", GEQ}
};

// single char ops
static const unordered_map<char, Tokens> singles = {
    {'(', LPAR}, {')', RPAR}, {'[', LBRACK}, {']', RBRACK}, 
    {'+', PLUS}, {'-', MINUS}, {'*', MULTI}, {'=', EQ}, 
    {'<', LT}, {'>', GT}, {';', SEMI}
};

static vector<Tokens> tokens;

/**
 * returns true if the current character is a single character of interest
 */
bool is_single_char(int ch)
{
    switch (ch)
    {
    case '(':
    case ')':
    case '[':
    case ']':
    case '+':
    case '-':
    case '*':
    case '=':
    case '<':
    case '>':
    case ';':
        return true;
    default:
        return false;
    }
}

//this s here for testing
static const std::unordered_map<Tokens, string> TOKEN_NAME = {
  {TRUE,"TRUE"}, {FALSE,"FALSE"}, {IF,"IF"}, {THEN,"THEN"}, {ELSE,"ELSE"}, {FI,"FI"},
  {WHILE,"WHILE"}, {DO,"DO"}, {OD,"OD"}, {SKIP,"SKIP"}, {NOT,"NOT"}, {AND,"AND"}, {OR,"OR"},
  {ID,"ID"}, {NUM,"NUM"}, {LPAR,"LPAR"}, {RPAR,"RPAR"}, {LBRACK,"LBRACK"}, {RBRACK,"RBRACK"},
  {PLUS,"PLUS"}, {MINUS,"MINUS"}, {MULTI,"MULTI"}, {EQ,"EQ"}, {LT,"LT"}, {GT,"GT"},
  {LEQ,"LEQ"}, {GEQ,"GEQ"}, {ASSIGN,"ASSIGN"}, {SEMI,"SEMI"}, {END,"END"}
};


int main(int argc, char **argv)
{
    if (argc < 2)
    {
        cout << "Scanner needs an input file" << endl;
        return 1;
    }

    ifstream in(argv[1], ios::binary);
    for (int ch = in.get(); ch != EOF; ch = in.get())
    {
        unsigned char c = static_cast<unsigned char>(ch);

        // skipping block comments
        if (ch == '{' && in.peek() == '-')
        {
            in.get();
            int prev = 0;
            for (int d = in.get(); d != EOF; d = in.get())
            {
                if (prev == '-' && d == '}')
                    break;
                prev = d;
            }
            continue;
        }

        // skipping inline comments
        if (ch == '-' && in.peek() == '-')
        {
            for (int d = in.get(); d != EOF; d = in.get())
                if (d == '\n')
                {
                    in.get();
                    break;
                }
            continue;
        }

        //Todo: single character opperators print but so do 
        //ops that are part of larger strings. 
        if (is_single_char(ch))
        {
            tokens.push_back(singles.find(ch)->second);
        }
        cout << c;
    }

    //prints the vector of tokens
    cout << "\nSingle tokens:" << endl;
    for (size_t i = 1; i <= tokens.size(); i++)
    {
        cout <<"[" << TOKEN_NAME.find(tokens[i-1]) -> second << "], ";
        if (i % 10 == 0) cout << '\n';
    }

    cout << '\n';
    return 0;
}