#include "API.h"

namespace onyx {

    Vector3 constructVector3(float value)
    {
        return Vector3(value);
    }

    std::shared_ptr<Vector3> constructShared(float value)
    {
        return std::make_shared<Vector3>(value);
    }

    bool initialize(size_t width, size_t height)
    {
        // perform initialization here
        return true;
    }

}