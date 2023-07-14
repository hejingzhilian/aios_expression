#include<iostream>
#include<gtest/gtest.h>

#include "autil/Log.h"

class GraphTest: public testing::Test {

public:
    GraphTest() {}
    ~GraphTest() {}
 public:
     AUTIL_LOG_DECLARE();
};

AUTIL_LOG_SETUP(aaa,GraphTest);

TEST_F(GraphTest, DebugTest) {
   // std::cout << graph.DebugString() << std::endl;
   AUTIL_LOG(ERROR, " test %d", 1);
}

int main(int argc, char* argv[]) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
