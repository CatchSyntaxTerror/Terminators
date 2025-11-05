#include "labeler.hpp"
#include <typeinfo>

using namespace whilec;

void Labeler::run(Node* n) {
    counter = 0;
    visit(n);
}

void Labeler::visit(Node* n) {
    if (!n) return;

    if (auto p = dynamic_cast<Program*>(n)) {
        visit(p->cmd.get());
        return;
    }

    if (auto p = dynamic_cast<Assign*>(n)) {
        p->label = next();
        if (p->expr) visit(p->expr.get());
        return;
    }

    if (auto p = dynamic_cast<Skip*>(n)) {
        p->label = next();
        return;
    }

    if (auto p = dynamic_cast<Seq*>(n)) {
        visit(p->left.get());
        visit(p->right.get());
        return;
    }

    if (auto p = dynamic_cast<If*>(n)) {
        p->label = next();              
        if (p->cond) visit(p->cond.get());
        visit(p->then_cmd.get());
        visit(p->else_cmd.get());
        return;
    }

    if (auto p = dynamic_cast<While*>(n)) {
        p->label = next();               
        if (p->cond) visit(p->cond.get());
        visit(p->body.get());
        return;
    }


    if (auto p = dynamic_cast<Int*>(n)) {
        (void)p; 
        return;
    }
    if (auto p = dynamic_cast<Var*>(n)) {
        (void)p;
        return;
    }
    if (auto p = dynamic_cast<ABin*>(n)) {
        visit(p->left.get());
        visit(p->right.get());
        return;
    }
    if (auto p = dynamic_cast<Bool*>(n)) {
        (void)p;
        return;
    }
    if (auto p = dynamic_cast<Not*>(n)) {
        visit(p->bexp.get());
        return;
    }
    if (auto p = dynamic_cast<BBin*>(n)) {
        visit(p->left.get());
        visit(p->right.get());
        return;
    }
    if (auto p = dynamic_cast<Rel*>(n)) {
        visit(p->left.get());
        visit(p->right.get());
        return;
    }
}
