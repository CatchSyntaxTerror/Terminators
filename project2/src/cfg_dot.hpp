#pragma once
#include "cfg.hpp"
#include <string>

namespace whilec {

    void emitCFGDot(const CFG& cfg, const std::string& filename);

}
