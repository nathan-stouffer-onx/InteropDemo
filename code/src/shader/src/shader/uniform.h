#pragma once

namespace onyx {
namespace shader {

    class uniform
    {
    public:

        uniform();
        ~uniform();

        bool is_valid();

    private:

        int m_handle;

    };

}
}