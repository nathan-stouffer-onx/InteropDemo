//
//  CxxTest.cpp
//  CxxTest
//
//  Created by Nathan Stouffer on 10/5/23.
//

#include "CxxTest.hpp"

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
