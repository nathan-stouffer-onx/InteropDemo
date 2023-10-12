#pragma once

#include "Types.h"

namespace onyx {

    using Vector3 = lucid::tile::Vector3;

    Vector3 constructVector3(float value);

    std::shared_ptr<Vector3> constructShared(float value);

    bool initialize(size_t width, size_t height);

}