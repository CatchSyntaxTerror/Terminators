//./gen /data/yue/compilier/Terminators/project2/dotfiles/cfg.dot
#include <iostream>
#include <fstream>
#include <sstream>
#include <regex>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <string>
#include <algorithm>

using namespace std;


struct Node {
    int label;
    string stmt;
    vector<int> succ;
    unordered_set<string> gen;
    unordered_set<string> kill;
};

unordered_map<int, Node> nodes;

unordered_set<string> extract_vars(const string &s) {
    unordered_set<string> vars;
    regex re("([a-zA-Z_][a-zA-Z0-9_]*)");
    for (auto it = sregex_iterator(s.begin(), s.end(), re);
         it != sregex_iterator(); ++it)
    {
        string v = it->str();
        if (v == "if" || v == "then" || v == "else" ||
            v == "while" || v == "do" || v == "skip")
            continue;
        vars.insert(v);
    }
    return vars;
}

void compute_gen_kill(Node &n) {
    string s = n.stmt;

    size_t pos = s.find(":=");
    if (pos != string::npos) {
        string lhs = s.substr(0, pos);
        lhs.erase(remove_if(lhs.begin(), lhs.end(), ::isspace), lhs.end());
        n.kill.insert(lhs);

        string rhs = s.substr(pos + 2);
        auto vars = extract_vars(rhs);
        vars.erase(lhs);
        for (auto &v : vars) n.gen.insert(v);
        return;
    }

    if (s == "skip") return;

    if (s.rfind("if", 0) == 0 || s.rfind("while", 0) == 0) {
        size_t p1 = s.find("(");
        size_t p2 = s.rfind(")");
        if (p1 != string::npos && p2 != string::npos) {
            string cond = s.substr(p1, p2 - p1 + 1);
            auto vars = extract_vars(cond);
            for (auto &v : vars) n.gen.insert(v);
        }
        return;
    }
}

void parse_cfg_dot(const string &path) {
    ifstream in(path);
    string line;

    regex node_re(R"xxx((\d+)\s*\[label="ℓ=\d+\\n(.*?)"\];)xxx");
    regex edge_re(R"xxx((\d+)\s*->\s*(\d+))xxx");


    while (getline(in, line)) {
        smatch m;

        if (regex_search(line, m, node_re)) {
            int id = stoi(m[1].str());
            string stmt = m[2].str();
            nodes[id] = Node{id, stmt};
        }
        else if (regex_search(line, m, edge_re)) {
            int from = stoi(m[1].str());
            int to = stoi(m[2].str());
            nodes[from].succ.push_back(to);
        }
    }
}

void print_equations() {
    for (auto &p : nodes) {
        Node &n = p.second;

        cout << "ℓ=" << n.label << ": " << n.stmt << "\n";
        
        cout << "  gen = {";
        bool f = true;
        for (auto &v : n.gen) { if (!f) cout << ", "; cout << v; f=false; }
        cout << "}\n";

        cout << "  kill = {";
        f = true;
        for (auto &v : n.kill) { if (!f) cout << ", "; cout << v; f=false; }
        cout << "}\n";

        cout << "  OUT[" << n.label << "] = ";
        if (n.succ.empty()) {
            cout << "EXIT_LIVE\n";
        } else {
            bool first = true;
            for (int s : n.succ) {
                if (!first) cout << " ∪ ";
                cout << "IN[" << s << "]";
                first = false;
            }
            cout << "\n";
        }

        cout << "  IN[" << n.label << "] = gen ∪ (OUT[" 
             << n.label << "] \\ kill)\n\n";
    }
}
void print_equations_to_file(const string &outfile) {
    ofstream out(outfile);
    if (!out) {
        cerr << "Cannot open " << outfile << endl;
        exit(1);
    }

    for (auto &p : nodes) {
        Node &n = p.second;

        out << "ℓ=" << n.label << ": " << n.stmt << "\n";
        
        out << "  gen = {";
        bool f = true;
        for (auto &v : n.gen) { if (!f) out << ", "; out << v; f=false; }
        out << "}\n";

        out << "  kill = {";
        f = true;
        for (auto &v : n.kill) { if (!f) out << ", "; out << v; f=false; }
        out << "}\n";

        out << "  OUT[" << n.label << "] = ";
        if (n.succ.empty()) {
            out << "EXIT_LIVE\n";
        } else {
            bool first = true;
            for (int s : n.succ) {
                if (!first) out << " ∪ ";
                out << "IN[" << s << "]";
                first = false;
            }
            out << "\n";
        }

        out << "  IN[" << n.label << "] = gen ∪ (OUT[" 
            << n.label << "] \\ kill)\n\n";
    }

    out.close();
}

int main(int argc, char **argv) {
    if (argc < 3) {
        cerr << "Usage: " << argv[0] << " cfg.dot task7_output.txt\n";
        return 1;
    }

    string dotfile = argv[1];
    string outfile = argv[2];

    parse_cfg_dot(dotfile);

    for (auto &p : nodes)
        compute_gen_kill(p.second);

    print_equations_to_file(outfile);

    return 0;
}
