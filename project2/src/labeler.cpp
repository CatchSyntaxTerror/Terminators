#include "labeler.hpp"
#include <typeinfo>

using namespace whilec;

void Labeler::run(Node* n) {
    counter = 0;
    visit(n);
}

void Labeler::visit(Node* n) {
    if (!n) return;

    // 顶层 Program：继续深入到命令
    if (auto p = dynamic_cast<Program*>(n)) {
        visit(p->cmd.get());
        return;
    }

    // 赋值语句：贴标签到该语句
    if (auto p = dynamic_cast<Assign*>(n)) {
        p->label = next();
        // 表达式节点不贴标签，这里可选地遍历但不会改变任何 label
        if (p->expr) visit(p->expr.get());
        return;
    }

    // skip：贴标签到该语句
    if (auto p = dynamic_cast<Skip*>(n)) {
        p->label = next();
        return;
    }

    // 顺序复合：不贴标签，只遍历两个子语句
    if (auto p = dynamic_cast<Seq*>(n)) {
        visit(p->left.get());
        visit(p->right.get());
        return;
    }

    // if：标签贴在条件点（if 节点本身），分支内按规则递归
    if (auto p = dynamic_cast<If*>(n)) {
        p->label = next();               // 条件点标签
        // 条件本身是表达式，不贴标签；可遍历以一致性
        if (p->cond) visit(p->cond.get());
        visit(p->then_cmd.get());
        visit(p->else_cmd.get());
        return;
    }

    // while：标签贴在循环条件点（while 节点本身），循环体递归
    if (auto p = dynamic_cast<While*>(n)) {
        p->label = next();               // 条件点标签
        // 条件本身是表达式，不贴标签；可遍历以一致性
        if (p->cond) visit(p->cond.get());
        visit(p->body.get());
        return;
    }

    // ====== 以下是表达式类节点：都不贴标签，只做占位遍历（可省略） ======

    if (auto p = dynamic_cast<Int*>(n)) {
        (void)p; // 无操作
        return;
    }
    if (auto p = dynamic_cast<Var*>(n)) {
        (void)p;
        return;
    }
    if (auto p = dynamic_cast<ABin*>(n)) {
        // 递归其左右表达式（不贴标签）
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

    // 其他未覆盖的节点类型（如果以后扩展）可在此继续添加
}
