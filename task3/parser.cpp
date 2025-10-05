// while_parser.cpp
// C++17 hand-written lexer + recursive-descent parser for the WHILE language
// Usage:
//   g++ -std=c++17 -O2 while_parser.cpp -o while_parser
//   ./while_parser examples.while
//   dot -Tpdf ast.dot -o ast.pdf

#include <bits/stdc++.h>
using namespace std;

// ===================== AST Nodes =====================
struct Node { virtual ~Node() = default; };

struct Program : Node {
    unique_ptr<Node> cmd;
    explicit Program(unique_ptr<Node> c): cmd(move(c)) {}
};

struct Seq : Node {
    unique_ptr<Node> left, right;
    Seq(unique_ptr<Node> l, unique_ptr<Node> r): left(move(l)), right(move(r)) {}
};

struct Assign : Node {
    string name;
    unique_ptr<Node> expr;
    Assign(string n, unique_ptr<Node> e): name(move(n)), expr(move(e)) {}
};

struct Skip : Node {};

struct If : Node {
    unique_ptr<Node> cond, then_cmd, else_cmd;
    If(unique_ptr<Node> c, unique_ptr<Node> t, unique_ptr<Node> e)
        : cond(move(c)), then_cmd(move(t)), else_cmd(move(e)) {}
};

struct While : Node {
    unique_ptr<Node> cond, body;
    While(unique_ptr<Node> c, unique_ptr<Node> b): cond(move(c)), body(move(b)) {}
};

// Arithmetic
struct Int : Node {
    long long val;
    explicit Int(long long v): val(v) {}
};

struct Var : Node {
    string name;
    explicit Var(string n): name(move(n)) {}
};

struct ABin : Node {
    string op; // "+", "-", "*"
    unique_ptr<Node> left, right;
    ABin(string o, unique_ptr<Node> l, unique_ptr<Node> r)
        : op(move(o)), left(move(l)), right(move(r)) {}
};

// Boolean
struct Bool : Node {
    bool val;
    explicit Bool(bool v): val(v) {}
};

struct Not : Node {
    unique_ptr<Node> bexp;
    explicit Not(unique_ptr<Node> e): bexp(move(e)) {}
};

struct BBin : Node {
    string op; // "and" / "or"
    unique_ptr<Node> left, right;
    BBin(string o, unique_ptr<Node> l, unique_ptr<Node> r)
        : op(move(o)), left(move(l)), right(move(r)) {}
};

struct Rel : Node {
    string op; // "=", "<", "<=", ">", ">="
    unique_ptr<Node> left, right;
    Rel(string o, unique_ptr<Node> l, unique_ptr<Node> r)
        : op(move(o)), left(move(l)), right(move(r)) {}
};

// ===================== Tokens & Lexer =====================
enum class TokenType {
    // identifiers & literals
    ID, NUM,
    // keywords
    IF, THEN, ELSE, FI,
    WHILE, DO, OD,
    SKIP, TRUE, FALSE,
    NOT, AND, OR,
    // symbols/operators
    ASSIGN,     // :=
    SEMI,       // ;
    LPAR, RPAR, // ( )
    LBRACK, RBRACK, // [ ]
    PLUS, MINUS, MULTI, // + - *
    EQ, LT, GT, LEQ, GEQ, // = < > <= >=
    // end & invalid
    END_OF_FILE, INVALID
};

struct Token {
    TokenType type;
    string lexeme;
    long long intValue = 0;
    int line = 1;
};

class Lexer {
public:
    explicit Lexer(string src): s(move(src)) {}
    Token next() {
        skipSpacesAndComments();
        Token t; t.line = line;
        if (pos >= (int)s.size()) { t.type = TokenType::END_OF_FILE; return t; }

        // Multi-char operators first
        if (match(":=")) return make(TokenType::ASSIGN, ":=");
        if (match("<=")) return make(TokenType::LEQ, "<=");
        if (match(">=")) return make(TokenType::GEQ, ">=");

        // Single-char
        char c = s[pos];
        if (c == ';') { ++pos; return make(TokenType::SEMI, ";"); }
        if (c == '(') { ++pos; return make(TokenType::LPAR, "("); }
        if (c == ')') { ++pos; return make(TokenType::RPAR, ")"); }
        if (c == '[') { ++pos; return make(TokenType::LBRACK, "["); }
        if (c == ']') { ++pos; return make(TokenType::RBRACK, "]"); }
        if (c == '+') { ++pos; return make(TokenType::PLUS, "+"); }
        if (c == '-') {
            // Could be line comment, but handled in skip
            ++pos; return make(TokenType::MINUS, "-");
        }
        if (c == '*') { ++pos; return make(TokenType::MULTI, "*"); }
        if (c == '=') { ++pos; return make(TokenType::EQ, "="); }
        if (c == '<') { ++pos; return make(TokenType::LT, "<"); }
        if (c == '>') { ++pos; return make(TokenType::GT, ">"); }

        // Number
        if (isdigit((unsigned char)c)) {
            int start = pos;
            long long v = 0;
            while (pos < (int)s.size() && isdigit((unsigned char)s[pos])) {
                v = v * 10 + (s[pos] - '0');
                ++pos;
            }
            Token t = make(TokenType::NUM, s.substr(start, pos - start));
            t.intValue = v; return t;
        }

        // Identifier / keyword
        if (isalpha((unsigned char)c)) {
            int start = pos;
            while (pos < (int)s.size() && (isalnum((unsigned char)s[pos]) || s[pos] == '_' || s[pos] == '\'')) ++pos;
            string lex = s.substr(start, pos - start);
            auto it = keywords.find(lex);
            if (it != keywords.end()) return make(it->second, lex);
            Token t = make(TokenType::ID, lex); return t;
        }

        // Unknown char
        {
            string bad(1, s[pos]);
            ++pos;
            Token t = make(TokenType::INVALID, bad);
            return t;
        }
    }

    int currentLine() const { return line; }

private:
    string s;
    int pos = 0;
    int line = 1;

    static const unordered_map<string, TokenType> keywords;

    bool match(const char* p) {
        size_t n = strlen(p);
        if (pos + (int)n <= (int)s.size() && s.compare(pos, n, p) == 0) {
            pos += (int)n; return true;
        }
        return false;
    }

    Token make(TokenType tp, string lx) {
        Token t; t.type = tp; t.lexeme = move(lx); t.line = line; return t;
    }

    void skipSpacesAndComments() {
        while (pos < (int)s.size()) {
            char c = s[pos];
            // whitespace
            if (c == ' ' || c == '\t' || c == '\r') { ++pos; continue; }
            if (c == '\n') { ++pos; ++line; continue; }

            // line comment: --
            if (c == '-' && pos + 1 < (int)s.size() && s[pos+1] == '-') {
                pos += 2;
                while (pos < (int)s.size() && s[pos] != '\n') ++pos;
                continue;
            }
            // block comment: {- ... -}
            if (c == '{' && pos + 1 < (int)s.size() && s[pos+1] == '-') {
                pos += 2;
                while (pos < (int)s.size()) {
                    if (s[pos] == '\n') { ++line; ++pos; continue; }
                    if (s[pos] == '-' && pos + 1 < (int)s.size() && s[pos+1] == '}') { pos += 2; break; }
                    ++pos;
                }
                continue;
            }
            break;
        }
    }
};

const unordered_map<string, TokenType> Lexer::keywords = {
    {"if", TokenType::IF}, {"then", TokenType::THEN}, {"else", TokenType::ELSE}, {"fi", TokenType::FI},
    {"while", TokenType::WHILE}, {"do", TokenType::DO}, {"od", TokenType::OD},
    {"skip", TokenType::SKIP},
    {"true", TokenType::TRUE}, {"false", TokenType::FALSE},
    {"not", TokenType::NOT}, {"and", TokenType::AND}, {"or", TokenType::OR},
};

// ===================== Parser =====================
class Parser {
public:
    explicit Parser(Lexer& lx): lex(lx) { advance(); }

    unique_ptr<Program> parseProgram() {
        auto cmd = parseCommand();
        expect(TokenType::END_OF_FILE);
        return make_unique<Program>(move(cmd));
    }

private:
    Lexer& lex;
    Token cur;

    // ---- utilities ----
    void advance() { cur = lex.next(); }
    bool accept(TokenType t) { if (cur.type==t){ advance(); return true; } return false; }
    void expect(TokenType t) {
        if (!accept(t)) error(string("expected token ")+tokenName(t)+", got "+tokenName(cur.type));
    }
    [[noreturn]] void error(const string& msg) {
        ostringstream oss;
        oss << "PARSE ERROR (line " << cur.line << "): " << msg << " (lexeme='" << cur.lexeme << "')";
        throw runtime_error(oss.str());
    }
    static const char* tokenName(TokenType t) {
        switch(t){
            case TokenType::ID: return "ID"; case TokenType::NUM: return "NUM";
            case TokenType::IF: return "IF"; case TokenType::THEN: return "THEN";
            case TokenType::ELSE: return "ELSE"; case TokenType::FI: return "FI";
            case TokenType::WHILE: return "WHILE"; case TokenType::DO: return "DO";
            case TokenType::OD: return "OD"; case TokenType::SKIP: return "SKIP";
            case TokenType::TRUE: return "TRUE"; case TokenType::FALSE: return "FALSE";
            case TokenType::NOT: return "NOT"; case TokenType::AND: return "AND"; case TokenType::OR: return "OR";
            case TokenType::ASSIGN: return "ASSIGN"; case TokenType::SEMI: return "SEMI";
            case TokenType::LPAR: return "LPAR"; case TokenType::RPAR: return "RPAR";
            case TokenType::LBRACK: return "LBRACK"; case TokenType::RBRACK: return "RBRACK";
            case TokenType::PLUS: return "PLUS"; case TokenType::MINUS: return "MINUS"; case TokenType::MULTI: return "MULTI";
            case TokenType::EQ: return "EQ"; case TokenType::LT: return "LT"; case TokenType::GT: return "GT";
            case TokenType::LEQ: return "LEQ"; case TokenType::GEQ: return "GEQ";
            case TokenType::END_OF_FILE: return "EOF"; default: return "INVALID";
        }
    }

    // ---- grammar ----
    // Program ::= Command
    unique_ptr<Node> parseCommand() {
        // Command ::= SimpleCommand (';' SimpleCommand)*
        auto left = parseSimpleCommand();
        while (accept(TokenType::SEMI)) {
            auto right = parseSimpleCommand();
            left = make_unique<Seq>(move(left), move(right));
        }
        return left;
    }

    // SimpleCommand
    unique_ptr<Node> parseSimpleCommand() {
        if (cur.type == TokenType::ID) {
            string name = cur.lexeme; advance();
            expect(TokenType::ASSIGN);
            auto expr = parseAExp();
            return make_unique<Assign>(name, move(expr));
        }
        if (accept(TokenType::SKIP)) {
            return make_unique<Skip>();
        }
        if (accept(TokenType::IF)) {
            auto cond = parseBExp();
            expect(TokenType::THEN);
            auto then_cmd = parseCommand();
            expect(TokenType::ELSE);
            auto else_cmd = parseCommand();
            expect(TokenType::FI);
            return make_unique<If>(move(cond), move(then_cmd), move(else_cmd));
        }
        if (accept(TokenType::WHILE)) {
            auto cond = parseBExp();
            expect(TokenType::DO);
            auto body = parseCommand();
            expect(TokenType::OD);
            return make_unique<While>(move(cond), move(body));
        }
        error("expected SimpleCommand (ID/if/while/skip)");
    }

    // AExp -> AddExp
    unique_ptr<Node> parseAExp() { return parseAddExp(); }

    // AddExp : AddExp (+|-) MulExp | MulExp     (left-assoc)
    unique_ptr<Node> parseAddExp() {
        auto left = parseMulExp();
        while (cur.type == TokenType::PLUS || cur.type == TokenType::MINUS) {
            string op = (cur.type == TokenType::PLUS ? "+" : "-");
            advance();
            auto right = parseMulExp();
            left = make_unique<ABin>(op, move(left), move(right));
        }
        return left;
    }

    // MulExp : MulExp * Atom | Atom             (left-assoc)
    unique_ptr<Node> parseMulExp() {
        auto left = parseAtom();
        while (cur.type == TokenType::MULTI) {
            string op = "*"; advance();
            auto right = parseAtom();
            left = make_unique<ABin>(op, move(left), move(right));
        }
        return left;
    }

    // Atom : '(' AExp ')' | ID | Integer
    unique_ptr<Node> parseAtom() {
        if (accept(TokenType::LPAR)) {
            auto e = parseAExp();
            expect(TokenType::RPAR);
            return e;
        }
        if (cur.type == TokenType::ID) {
            string name = cur.lexeme; advance();
            return make_unique<Var>(name);
        }
        if (cur.type == TokenType::NUM) {
            long long v = cur.intValue; advance();
            return make_unique<Int>(v);
        }
        error("expected Atom '(' or ID or NUM");
    }

    // BExp -> OrExp
    unique_ptr<Node> parseBExp() { return parseOrExp(); }

    // OrExp : OrExp OR AndExp | AndExp
    unique_ptr<Node> parseOrExp() {
        auto left = parseAndExp();
        while (accept(TokenType::OR)) {
            auto right = parseAndExp();
            left = make_unique<BBin>("or", move(left), move(right));
        }
        return left;
    }

    // AndExp : AndExp AND NotExp | NotExp
    unique_ptr<Node> parseAndExp() {
        auto left = parseNotExp();
        while (accept(TokenType::AND)) {
            auto right = parseNotExp();
            left = make_unique<BBin>("and", move(left), move(right));
        }
        return left;
    }

    // Not / [ ] / Rel / true / false
    // NotExp : NOT '[' BExp ']' | '[' BExp ']' | RelExp | TRUE | FALSE
    unique_ptr<Node> parseNotExp() {
        if (accept(TokenType::NOT)) {
            expect(TokenType::LBRACK);
            auto e = parseBExp();
            expect(TokenType::RBRACK);
            return make_unique<Not>(move(e));
        }
        if (accept(TokenType::LBRACK)) {
            auto e = parseBExp();
            expect(TokenType::RBRACK);
            return e;
        }
        if (accept(TokenType::TRUE))  return make_unique<Bool>(true);
        if (accept(TokenType::FALSE)) return make_unique<Bool>(false);
        return parseRelExp();
    }

    // RelExp : AExp (=|<|<=|>|>=) AExp
    unique_ptr<Node> parseRelExp() {
        auto lhs = parseAExp();
        if (cur.type==TokenType::EQ || cur.type==TokenType::LT || cur.type==TokenType::LEQ
            || cur.type==TokenType::GT || cur.type==TokenType::GEQ) {
            string op;
            switch (cur.type) {
                case TokenType::EQ:  op = "="; break;
                case TokenType::LT:  op = "<"; break;
                case TokenType::LEQ: op = "<="; break;
                case TokenType::GT:  op = ">"; break;
                case TokenType::GEQ: op = ">="; break;
                default: break;
            }
            advance();
            auto rhs = parseAExp();
            return make_unique<Rel>(op, move(lhs), move(rhs));
        }
        error("expected relational op (=,<,<=,>,>=) in boolean expression");
    }
};

// ===================== DOT Export =====================
struct DotEmitter {
    vector<string> out;
    int counter = 0;

    string nid() { return "n" + to_string(++counter); }
    static string esc(const string& s) {
        string r; r.reserve(s.size());
        for(char c: s){ if(c=='"') r+="\\\""; else r+=c; }
        return r;
    }

    string walk(Node* node) {
        if (!node) {
            string name = nid(); out.push_back(name + " [label=\"∅\"];"); return name;
        }
        string name = nid();
        if (auto p = dynamic_cast<Program*>(node)) {
            out.push_back(name + " [label=\"Program\"];");
            string c = walk(p->cmd.get()); out.push_back(name + " -> " + c + ";");
        } else if (auto s = dynamic_cast<Seq*>(node)) {
            out.push_back(name + " [label=\";\"];");
            string l = walk(s->left.get()); string r = walk(s->right.get());
            out.push_back(name + " -> " + l + ";"); out.push_back(name + " -> " + r + ";");
        } else if (auto a = dynamic_cast<Assign*>(node)) {
            out.push_back(name + " [label=\":=\"];");
            string v = nid(); out.push_back(v + " [label=\"Id(" + esc(a->name) + ")\"];");
            string e = walk(a->expr.get());
            out.push_back(name + " -> " + v + ";"); out.push_back(name + " -> " + e + ";");
        } else if (dynamic_cast<Skip*>(node)) {
            out.push_back(name + string(" [label=\"skip\"];"));
        } else if (auto i = dynamic_cast<If*>(node)) {
            out.push_back(name + " [label=\"if\"];");
            string c = walk(i->cond.get()); string t = walk(i->then_cmd.get()); string e = walk(i->else_cmd.get());
            out.push_back(name + " -> " + c + " [label=\"cond\"];");
            out.push_back(name + " -> " + t + " [label=\"then\"];");
            out.push_back(name + " -> " + e + " [label=\"else\"];");
        } else if (auto w = dynamic_cast<While*>(node)) {
            out.push_back(name + " [label=\"while\"];");
            string c = walk(w->cond.get()); string b = walk(w->body.get());
            out.push_back(name + " -> " + c + " [label=\"cond\"];");
            out.push_back(name + " -> " + b + " [label=\"body\"];");
        } else if (auto in = dynamic_cast<Int*>(node)) {
            out.push_back(name + " [label=\"Int(" + to_string(in->val) + ")\"];");
        } else if (auto v = dynamic_cast<Var*>(node)) {
            out.push_back(name + " [label=\"Id(" + esc(v->name) + ")\"];");
        } else if (auto ab = dynamic_cast<ABin*>(node)) {
            out.push_back(name + " [label=\"A:" + esc(ab->op) + "\"];");
            string l = walk(ab->left.get()); string r = walk(ab->right.get());
            out.push_back(name + " -> " + l + ";"); out.push_back(name + " -> " + r + ";");
        } else if (auto b = dynamic_cast<Bool*>(node)) {
            out.push_back(name + " [label=\"Bool(" + string(b->val ? "true" : "false") + ")\"];");
        } else if (auto n = dynamic_cast<Not*>(node)) {
            out.push_back(name + " [label=\"not\"];");
            string c = walk(n->bexp.get()); out.push_back(name + " -> " + c + ";");
        } else if (auto bb = dynamic_cast<BBin*>(node)) {
            out.push_back(name + " [label=\"B:" + esc(bb->op) + "\"];");
            string l = walk(bb->left.get()); string r = walk(bb->right.get());
            out.push_back(name + " -> " + l + ";"); out.push_back(name + " -> " + r + ";");
        } else if (auto r = dynamic_cast<Rel*>(node)) {
            out.push_back(name + " [label=\"Rel(" + esc(r->op) + ")\"];");
            string l = walk(r->left.get()); string rr = walk(r->right.get());
            out.push_back(name + " -> " + l + ";"); out.push_back(name + " -> " + rr + ";");
        } else {
            out.push_back(name + " [label=\"Unknown\"];");
        }
        return name;
    }

    void emit(Node* root, const string& filename="ast.dot") {
        out.clear(); counter = 0;
        walk(root);
        ofstream f(filename);
        f << "digraph AST {\n  node [shape=box, fontname=\"Courier\"];\n";
        for (auto& line : out) f << "  " << line << "\n";
        f << "}\n";
    }
};

// ===================== CLI =====================
int main(int argc, char** argv) {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    // Read input file or stdin
    string code;
    if (argc >= 2) {
        ifstream in(argv[1]);
        if (!in) { cerr << "Failed to open file: " << argv[1] << "\n"; return 1; }
        stringstream buffer; buffer << in.rdbuf(); code = buffer.str();
    } else {
        stringstream buffer; buffer << cin.rdbuf(); code = buffer.str();
    }

    try {
        Lexer lx(code);
        Parser ps(lx);
        auto prog = ps.parseProgram();
        cout << "OK: parse succeeded.\n";
        DotEmitter de; de.emit(prog.get(), "ast.dot");
        cout << "DOT written to ast.dot\n";
        return 0;
    } catch (const exception& e) {
        cerr << e.what() << "\n";
        cerr << "Parse failed.\n";
        return 2;
    }
}
