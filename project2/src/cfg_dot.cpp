#include "cfg_dot.hpp"
#include <fstream>

namespace whilec
{

    void emitCFGDot(const CFG &cfg, const std::string &filename)
    {
        std::ofstream out(filename);
        if (!out)
            throw std::runtime_error("Could not open dot output file");

        out << "digraph CFG {\n";
        out << "  node [shape=box];\n";

        // Emit nodes
        for (auto &[label, nodePtr] : cfg.nodes)
        {
            const CFGNode *n = nodePtr.get();
            std::string kind = "cmd";

            if (n->ast)
            {
                if (dynamic_cast<const Assign *>(n->ast))
                    kind = "assign";
                else if (dynamic_cast<const If *>(n->ast))
                    kind = "if";
                else if (dynamic_cast<const While *>(n->ast))
                    kind = "while";
                else if (dynamic_cast<const Skip *>(n->ast))
                    kind = "skip";
            }

            out << "  " << n->label
                << " [label=\"ℓ=" << n->label << "\\n"
                << kind << "\"];\n";
        }

        // Emit edges
        for (auto &[label, nodePtr] : cfg.nodes)
        {
            const CFGNode *n = nodePtr.get();
            if (!n->ast)
                continue;

            // IF edges
            if (auto i = dynamic_cast<const If *>(n->ast))
            {
                if (n->succ.size() == 2)
                {
                    out << "  " << n->label << " -> " << n->succ[0]->label
                        << " [label=\"true\"];\n";

                    out << "  " << n->label << " -> " << n->succ[1]->label
                        << " [label=\"false\"];\n";
                }
                continue;
            }

            // WHILE edges
            if (auto w = dynamic_cast<const While *>(n->ast))
            {
                if (!n->succ.empty())
                {
                    out << "  " << n->label << " -> " << n->succ[0]->label
                        << " [label=\"body\"];\n";

                    if (n->succ.size() >= 2)
                    {
                        out << "  " << n->label << " -> " << n->succ[1]->label
                            << " [label=\"exit\"];\n";
                    }
                }
                continue;
            }

            // Assign/skip
            for (const CFGNode *succ : n->succ)
            {
                out << "  " << n->label << " -> " << succ->label << ";\n";
            }
        }

        out << "}\n";
    }

}
