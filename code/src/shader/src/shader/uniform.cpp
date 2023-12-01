#include "uniform.h"

namespace onyx {
namespace shader {

    uniform::uniform() : m_handle(17) {}

    uniform::~uniform() {}

    bool uniform::is_valid() { return m_handle >= 0; }

}
}