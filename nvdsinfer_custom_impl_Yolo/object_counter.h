#ifndef OBJECT_COUNTER_H
#define OBJECT_COUNTER_H

#include <unordered_map>
#include <string>

class ObjectCounter {
public:
    static void incrementCount(int classId);
    static void resetCounts();
    static std::unordered_map<int, int> getCounts();
    static void printCounts();

private:
    static std::unordered_map<int, int> counts;
};

#endif // OBJECT_COUNTER_H