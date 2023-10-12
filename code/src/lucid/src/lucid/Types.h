#pragma once

#include "Vector.h"

namespace lucid {

    template<typename PrecisionT>
    struct InstantiateTypes
    {
        typedef math::Vector<PrecisionT, 3> Vector3;
        typedef math::Vector<PrecisionT, 4> Vector4;
    };
    
    typedef InstantiateTypes<float> tile;

}
