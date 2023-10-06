//
//  CxxTest.hpp
//  CxxTest
//
//  Created by Nathan Stouffer on 10/5/23.
//

#ifndef CxxTest_hpp
#define CxxTest_hpp

#include <cstdio>

#include <memory>

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

using Vector3 = lucid::tile::Vector3;

Vector3 constructVector3(float value);

std::shared_ptr<Vector3> constructShared(float value);

bool initialize(size_t width, size_t height);

#endif /* CxxTest_hpp */
