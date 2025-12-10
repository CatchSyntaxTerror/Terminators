#pragma once
#include <unordered_map>
#include <vector>
#include <memory>

#include "ast.hpp"
/**
 * cfg data structure. 
 */
namespace whilec {

    // CFG node
    struct CFGNode {
        int label;  
        const Node* ast;  
        std::vector<CFGNode*> succ;       

        CFGNode(int lbl, const Node* n) 
            : label(lbl), ast(n) {}
    };

    // CFG
    struct CFG {
        CFGNode* entry = nullptr;    
        CFGNode* stop = nullptr;                 
        std::unordered_map<int, std::unique_ptr<CFGNode>> nodes;  

        CFGNode* getOrCreate(int lbl, const Node* ast = nullptr) {
            auto it = nodes.find(lbl);
            if (it != nodes.end()) return it->second.get();

            nodes[lbl] = std::make_unique<CFGNode>(lbl, ast);
            return nodes[lbl].get();
        }
    };
    CFG buildCFG(const Program* root);
} 
