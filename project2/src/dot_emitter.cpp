#include "dot_emitter.hpp"
#include <fstream>

namespace whilec {

std::string DotEmitter::nid() { return "n" + std::to_string(++counter_); }

std::string DotEmitter::esc(const std::string &s) {
    std::string r; r.reserve(s.size());
    for (char c : s) r += (c == '"') ? "\\\"" : std::string(1, c);
    return r;
}

std::string DotEmitter::walk(const Node *node, const char* append_on_label) {
    auto with_append = [&](const std::string& base)->std::string {
        if (append_on_label && append_on_label[0] != '\0')
            return base + "\\n" + esc(append_on_label);
        return base;
    };

    if (!node) {
        std::string name = nid();
        out_.push_back(name + " [label=\"" + with_append("∅") + "\"];");
        return name;
    }

    std::string name = nid();

    if (auto p = dynamic_cast<const Program *>(node)) {
        out_.push_back(name + " [label=\"" + with_append("Program") + "\"];");
        std::string c = walk(p->cmd.get());
        out_.push_back(name + " -> " + c + ";");
    }
    else if (auto s = dynamic_cast<const Seq *>(node)) {
        out_.push_back(name + " [label=\"" + with_append(";") + "\"];");
        std::string l = walk(s->left.get());
        std::string r = walk(s->right.get());
        out_.push_back(name + " -> " + l + ";");
        out_.push_back(name + " -> " + r + ";");
    }
    else if (auto a = dynamic_cast<const Assign *>(node)) {
        out_.push_back(name + " [label=\":=\\n" + std::to_string(a->label) + "\"];");
        std::string v = nid();
        out_.push_back(v + " [label=\"Id(" + esc(a->name) + ")\"];");
        std::string e = walk(a->expr.get());
        out_.push_back(name + " -> " + v + ";");
        out_.push_back(name + " -> " + e + ";");
    }
    else if (auto sk = dynamic_cast<const Skip *>(node)) {
        out_.push_back(name + " [label=\"skip\\n" + std::to_string(sk->label) + "\"];");
    }
    else if (auto i = dynamic_cast<const If *>(node)) {
        out_.push_back(name + " [label=\"if\"];");
        std::string lab = std::to_string(i->label);
        std::string c = walk(i->cond.get(), lab.c_str()); 
        std::string t = walk(i->then_cmd.get());
        std::string e = walk(i->else_cmd.get());
        out_.push_back(name + " -> " + c + " [label=\"cond\"];");
        out_.push_back(name + " -> " + t + " [label=\"then\"];");
        out_.push_back(name + " -> " + e + " [label=\"else\"];");
    }
    else if (auto w = dynamic_cast<const While *>(node)) {
        out_.push_back(name + " [label=\"while\"];");
        std::string lab = std::to_string(w->label);
        std::string c = walk(w->cond.get(), lab.c_str()); 
        std::string b = walk(w->body.get());
        out_.push_back(name + " -> " + c + " [label=\"cond\"];");
        out_.push_back(name + " -> " + b + " [label=\"body\"];");
    }
    else if (auto in = dynamic_cast<const Int *>(node)) {
        out_.push_back(name + " [label=\"Int(" + std::to_string(in->val) + ")\"];");
    }
    else if (auto v = dynamic_cast<const Var *>(node)) {
        out_.push_back(name + " [label=\"Id(" + esc(v->name) + ")\"];");
    }
    else if (auto ab = dynamic_cast<const ABin *>(node)) {
        out_.push_back(name + " [label=\"A:" + esc(ab->op) + "\"];");
        std::string l = walk(ab->left.get());
        std::string r = walk(ab->right.get());
        out_.push_back(name + " -> " + l + ";");
        out_.push_back(name + " -> " + r + ";");
    }
    else if (auto b = dynamic_cast<const Bool *>(node)) {
        out_.push_back(name + " [label=\"" + with_append("Bool(" + std::string(b->val ? "true" : "false") + ")") + "\"];");
    }
    else if (auto n = dynamic_cast<const Not *>(node)) {
        out_.push_back(name + " [label=\"" + with_append("not") + "\"];");
        std::string c = walk(n->bexp.get());
        out_.push_back(name + " -> " + c + ";");
    }
    else if (auto bb = dynamic_cast<const BBin *>(node)) {
        out_.push_back(name + " [label=\"B:" + esc(bb->op) + "\"];");
        std::string l = walk(bb->left.get());
        std::string r = walk(bb->right.get());
        out_.push_back(name + " -> " + l + ";");
        out_.push_back(name + " -> " + r + ";");
    }
    else if (auto r = dynamic_cast<const Rel *>(node)) {
        out_.push_back(name + " [label=\"" + with_append("Rel(" + esc(r->op) + ")") + "\"];");
        std::string l = walk(r->left.get());
        std::string rr = walk(r->right.get());
        out_.push_back(name + " -> " + l + ";");
        out_.push_back(name + " -> " + rr + ";");
    }
    else {
        out_.push_back(name + " [label=\"" + with_append("Unknown") + "\"];");
    }

    return name;
}

void DotEmitter::emit(const Node *root, const std::string &filename) {
    out_.clear(); counter_ = 0;
    walk(root);
    std::ofstream f(filename);
    f << "digraph AST {\n  node [shape=ellipse, fontname=\"Courier\"];\n";
    for (auto &line : out_) f << "  " << line << "\n";
    f << "}\n";
}

} // namespace whilec

