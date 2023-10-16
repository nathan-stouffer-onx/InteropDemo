#pragma once

#include <memory>

#include <lucid/Types.h>
#include <shader/uniform.h>

namespace onyx {

    using Vector3 = lucid::tile::Vector3;

    Vector3 constructVector3(float value);

    shader::uniform consructUniform();

    std::shared_ptr<Vector3> constructShared(float value);

    bool initialize(size_t width, size_t height);

}