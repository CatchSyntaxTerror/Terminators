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

/* ------------------------------------------
   Data structures
------------------------------------------ */
struct Node {
    int label;
    string stmt;
    vector<int> succ;
    unordered_set<string> gen;
    unordered_set<string> kill;
};

unordered_map<int, Node> nodes;
unordered_map<int, unordered_set<string>> IN, OUT;
unordered_set<string> EXIT_LIVE;   // leave empty unless needed


/* ------------------------------------------
   Extract variables from a string
------------------------------------------ */
unordered_set<string> extract_vars(const string &s) {
    unordered_set<string> vars;
    regex re("([a-zA-Z_][a-zA-Z0-9_]*)");

    for (auto it = sregex_iterator(s.begin(), s.end(), re);
         it != sregex_iterator(); ++it)
    {
        string v = it->str();

        // keywords to ignore
        if (v == "if" || v == "then" || v == "else" ||
            v == "while" || v == "do" || v == "skip" ||
            v == "and" || v == "or" || v == "not" ||
            v == "true" || v == "false")
            continue;

        vars.insert(v);
    }
    return vars;
}

/* ------------------------------------------
   Compute gen/kill
------------------------------------------ */
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

        for (auto &v : vars)
            n.gen.insert(v);
        return;
    }

    if (s == "skip") return;

    if (s.rfind("if", 0) == 0 || s.rfind("while", 0) == 0) {
        size_t p1 = s.find("(");
        size_t p2 = s.rfind(")");
        if (p1 != string::npos && p2 != string::npos) {
            string cond = s.substr(p1, p2 - p1 + 1);
            auto vars = extract_vars(cond);
            for (auto &v : vars)
                n.gen.insert(v);
        }
        return;
    }
}


/* ------------------------------------------
   Parse CFG .dot file
------------------------------------------ */
void parse_cfg_dot(const string &path) {
    ifstream in(path);
    string line;

    regex node_re(R"xxx((\d+)\s*\[label="ℓ=\d+\\n(.*?)"\];)xxx");
    regex edge_re(R"xxx((\d+)\s*->\s*(\d+))xxx");

    while (getline(in, line)) {
        smatch m;

        if (regex_search(line, m, node_re)) {
            int id = stoi(m[1]);
            string stmt = m[2];
            nodes[id] = Node{id, stmt};
        }
        else if (regex_search(line, m, edge_re)) {
            int from = stoi(m[1]);
            int to   = stoi(m[2]);
            nodes[from].succ.push_back(to);
        }
    }
}


/* ------------------------------------------
   Task 8: Solve liveness fixpoint
------------------------------------------ */
void solve_liveness() {
    bool changed = true;

    // initialize IN/OUT
    for (auto &p : nodes) {
        int id = p.first;
        IN[id]  = unordered_set<string>();
        OUT[id] = unordered_set<string>();
    }

    // exit nodes
    for (auto &p : nodes)
        if (p.second.succ.empty())
            OUT[p.first] = EXIT_LIVE;

    // sort node labels in descending order (for backward analysis)
    vector<int> labels;
    for (auto &p : nodes) labels.push_back(p.first);
    sort(labels.begin(), labels.end(), greater<int>());

    // fixpoint iteration
    while (changed) {
        changed = false;

        for (int id : labels) {
            Node &n = nodes[id];

            auto oldIN  = IN[id];
            auto oldOUT = OUT[id];

            // OUT[id] = union of IN[succ]
            unordered_set<string> newOUT;
            for (int s : n.succ)
                for (auto &v : IN[s])
                    newOUT.insert(v);
            OUT[id] = newOUT;

            // IN[id] = gen ∪ (OUT \ kill)
            unordered_set<string> newIN = n.gen;
            for (auto &v : OUT[id])
                if (n.kill.find(v) == n.kill.end())
                    newIN.insert(v);
            IN[id] = newIN;

            if (IN[id] != oldIN || OUT[id] != oldOUT)
                changed = true;
        }
    }
}


/* ------------------------------------------
   Save Task 8 output to file
------------------------------------------ */
void save_task8_solution(const string &outfile) {
    ofstream out(outfile);
    if (!out) {
        cerr << "Cannot open output file: " << outfile << endl;
        exit(1);
    }

    out << "=== Task 8: Liveness Analysis Result (LV° / LV•) ===\n\n";

    // 为了输出有序，按 label 排序
    vector<int> labels;
    labels.reserve(nodes.size());
    for (auto &p : nodes) labels.push_back(p.first);
    sort(labels.begin(), labels.end());

    for (int id : labels) {
        Node &n = nodes[id];

        out << "ℓ=" << id << " : " << n.stmt << "\n";

        // LV° 对应 IN 集
        out << "  LV° = {";
        bool first = true;
        for (auto &v : IN[id]) {
            if (!first) out << ", ";
            out << v;
            first = false;
        }
        out << "}\n";

        // LV• 对应 OUT 集
        out << "  LV• = {";
        first = true;
        for (auto &v : OUT[id]) {
            if (!first) out << ", ";
            out << v;
            first = false;
        }
        out << "}\n\n";
    }

    out.close();
}



/* ------------------------------------------
   main()
------------------------------------------ */
int main(int argc, char **argv) {
    if (argc < 3) {
        cerr << "Usage: " << argv[0] << " cfg.dot task8_output.txt\n";
        return 1;
    }

    string cfgfile  = argv[1];
    string outfile  = argv[2];

    parse_cfg_dot(cfgfile);

    // compute gen/kill
    for (auto &p : nodes)
        compute_gen_kill(p.second);

    solve_liveness();                 // fixpoint solve

    save_task8_solution(outfile);     // save to file

    return 0;
}
