#pragma once
#include "cfg.hpp"
#include <unordered_map>
#include <unordered_set>
#include <string>

namespace whilec {

struct LivenessInfo {
    std::unordered_map<int, std::unordered_set<std::string>> in;
    std::unordered_map<int, std::unordered_set<std::string>> out;
};

LivenessInfo computeLiveness(const CFG& cfg,
                             const std::unordered_set<std::string>& exitLive);

std::unordered_set<int>
findDeadAssignments(const CFG& cfg, const LivenessInfo& liv);

} 
