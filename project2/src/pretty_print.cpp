#include "pretty_print.hpp"
#include <typeinfo>
#include <string>

using namespace whilec;

static void putIndent(std::ostream& out, int n) {
    while (n-- > 0) out << "  ";
}

static std::string exprToString(Node* e) {
    if (!e) return "";

    if (auto p = dynamic_cast<Int*>(e)) {
        return std::to_string(p->val);
    }
    if (auto p = dynamic_cast<Var*>(e)) {
        return p->name;
    }
    if (auto p = dynamic_cast<ABin*>(e)) {
        return "(" + exprToString(p->left.get()) + " " + p->op + " " + exprToString(p->right.get()) + ")";
    }
    if (auto p = dynamic_cast<Rel*>(e)) {
        return "(" + exprToString(p->left.get()) + " " + p->op + " " + exprToString(p->right.get()) + ")";
    }
    if (auto p = dynamic_cast<Bool*>(e)) {
        return p->val ? "true" : "false";
    }
    if (auto p = dynamic_cast<Not*>(e)) {
        return "(not " + exprToString(p->bexp.get()) + ")";
    }
    if (auto p = dynamic_cast<BBin*>(e)) {
        return "(" + exprToString(p->left.get()) + " " + p->op + " " + exprToString(p->right.get()) + ")";
    }
    return "?";
}

void whilec::prettyPrintLabeled(Node* n, std::ostream& out, int indent) {
    if (!n) return;

    if (auto p = dynamic_cast<Assign*>(n)) {
        putIndent(out, indent);
        out << "/*ℓ=" << p->label << "*/ " << p->name << " := "
            << exprToString(p->expr.get()) << ";\n";
    }
    else if (auto p = dynamic_cast<Skip*>(n)) {
        putIndent(out, indent);
        out << "/*ℓ=" << p->label << "*/ skip;\n";
    }
    else if (auto p = dynamic_cast<Seq*>(n)) {
        // Print left then right, preserving order
        prettyPrintLabeled(p->left.get(), out, indent);
        prettyPrintLabeled(p->right.get(), out, indent);
    }
    else if (auto p = dynamic_cast<If*>(n)) {
        putIndent(out, indent);
        out << "/*ℓ=" << p->label << "*/ if (" << exprToString(p->cond.get()) << ") then\n";
        prettyPrintLabeled(p->then_cmd.get(), out, indent + 1);
        putIndent(out, indent);
        out << "else\n";
        prettyPrintLabeled(p->else_cmd.get(), out, indent + 1);
        putIndent(out, indent);
        out << "fi\n";
    }
    else if (auto p = dynamic_cast<While*>(n)) {
        putIndent(out, indent);
        out << "/*ℓ=" << p->label << "*/ while (" << exprToString(p->cond.get()) << ") do\n";
        prettyPrintLabeled(p->body.get(), out, indent + 1);
        putIndent(out, indent);
        out << "od\n";
    }
    else if (auto p = dynamic_cast<Program*>(n)) {
        // Entry point: print its command
        prettyPrintLabeled(p->cmd.get(), out, indent);
    }
    // Expression nodes are not printed standalone.
}
void whilec::prettyPrintSingleLine(const Node* n, std::ostream& out)
{
    if (!n) return;

    if (auto p = dynamic_cast<const Assign*>(n)) {
        out << p->name << " := " << exprToString(p->expr.get());
    }
    else if (auto p = dynamic_cast<const Skip*>(n)) {
        out << "skip";
    }
    else if (auto p = dynamic_cast<const If*>(n)) {
        out << "if (" << exprToString(p->cond.get()) << ") then ...";
    }
    else if (auto p = dynamic_cast<const While*>(n)) {
        out << "while (" << exprToString(p->cond.get()) << ") do ...";
    }
    else {
        out << "unknown";
    }
}
