//
//  Vector.h
//  CxxTest
//
//  Created by Nathan Stouffer on 10/5/23.
//

#pragma once

#include <cmath>

namespace lucid {
namespace math {

    template<typename T, size_t D>
    struct Vector
    {
    public:
        
        T values[D];
        
        Vector() : Vector(T(0)) {}
        Vector(T value)
        {
            for (size_t i = 0; i < D; ++i)
            {
                values[i] = value;
            }
        }
        
        T& operator[](size_t i) { return values[i]; }
        T const& operator[](size_t i) const { return values[i]; }
        
    };

    template<typename T>
    struct Vector<T, 3>
    {
        T x, y, z;
        
        Vector() : Vector(T(0)) {}
        Vector(T value) : x(0), y(0), z(0) {}
        
        T& operator[](size_t i)
        {
            return const_cast<T&>(static_cast<Vector const&>(*this)[i]);
        }
        
        T const& operator[](size_t i) const
        {
            switch (i)
            {
                case 0: return x; break;
                case 1: return y; break;
                case 2: return z; break;
                default: return 0; break;
            }
        }
    };

    template<typename T, size_t D>
    T dot(Vector<T, D> const& lhs, Vector<T, D> const& rhs)
    {
        T product = T(0);
        for (size_t i = 0; i < D; ++i)
        {
            product += lhs[i] * rhs[i];
        }
        return product;
    }

    template<typename T, size_t D>
    T length(Vector<T, D> const& vec)
    {
        return std::sqrt(dot(vec, vec));
    }

} // math
} // lucid
