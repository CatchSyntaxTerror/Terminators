#include "cfg.hpp"
#include <stdexcept>

namespace whilec
{

    // recursive CFG construction
    static CFGNode *buildCmd(const Node *n, CFG &cfg, std::vector<CFGNode *> &exits);

    // Entry point
    CFG buildCFG(const Program *root)
    {
        if (!root || !root->cmd)
            throw std::runtime_error("buildCFG: Program root is null");

        CFG cfg;

        // Build the CFG
        std::vector<CFGNode *> exits;
        cfg.entry = buildCmd(root->cmd.get(), cfg, exits);

        return cfg;
    }

    // create or fetch nodes
    static CFGNode *nodeFor(const Node *n, CFG &cfg)
    {
        int lbl = 0;

        // Only command nodes should get here
        if (auto a = dynamic_cast<const Assign *>(n))
            lbl = a->label;
        else if (auto s = dynamic_cast<const Skip *>(n))
            lbl = s->label;
        else if (auto i = dynamic_cast<const If *>(n))
            lbl = i->label;
        else if (auto w = dynamic_cast<const While *>(n))
            lbl = w->label;
        else
            throw std::runtime_error("nodeFor: unexpected unlabeled node");

        return cfg.getOrCreate(lbl, n);
    }

    // Recursive CFG construction
    static CFGNode *buildCmd(const Node *n, CFG &cfg, std::vector<CFGNode *> &exits)
    {

        // SEQUENCE <-- SO ANNOYING!!!!!!!!!!!
        if (auto seq = dynamic_cast<const Seq *>(n))
        {
            std::vector<CFGNode *> leftExit;
            CFGNode *leftEntry = buildCmd(seq->left.get(), cfg, leftExit);

            std::vector<CFGNode *> rightExit;
            CFGNode *rightEntry = buildCmd(seq->right.get(), cfg, rightExit);

            // Connect all exits of left to entry of right
            for (CFGNode *e : leftExit)
                e->succ.push_back(rightEntry);

            // Exits seq
            exits = rightExit;

            return leftEntry;
        }

        // ASSIGN
        if (auto a = dynamic_cast<const Assign *>(n))
        {
            CFGNode *me = nodeFor(a, cfg);
            exits.push_back(me);
            return me;
        }

        // SKIP
        if (auto s = dynamic_cast<const Skip *>(n))
        {
            CFGNode *me = nodeFor(s, cfg);
            exits.push_back(me);
            return me;
        }

        // IF
        if (auto i = dynamic_cast<const If *>(n))
        {
            CFGNode *header = nodeFor(i, cfg);

            // Then branch
            std::vector<CFGNode *> tExit;
            CFGNode *tEntry = buildCmd(i->then_cmd.get(), cfg, tExit);

            // Else branch
            std::vector<CFGNode *> eExit;
            CFGNode *eEntry = buildCmd(i->else_cmd.get(), cfg, eExit);

            // Header has two outgoing edges
            header->succ.push_back(tEntry);
            header->succ.push_back(eEntry);

            // Exits of the IF are union of both branches
            exits.insert(exits.end(), tExit.begin(), tExit.end());
            exits.insert(exits.end(), eExit.begin(), eExit.end());

            return header;
        }

        // WHILE
        if (auto w = dynamic_cast<const While *>(n))
        {
            CFGNode *header = nodeFor(w, cfg);

            // Build the loop body
            std::vector<CFGNode *> bodyExit;
            CFGNode *bodyEntry = buildCmd(w->body.get(), cfg, bodyExit);

            // True branch
            header->succ.push_back(bodyEntry);

            // Back edges
            for (CFGNode *b : bodyExit)
                b->succ.push_back(header);

            // False branch
            exits.push_back(header);

            return header;
        }

        throw std::runtime_error("buildCmd: unknown node type");
    }

}
