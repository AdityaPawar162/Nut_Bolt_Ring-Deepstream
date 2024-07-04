#include "object_counter.h"
#include <iostream>

std::unordered_map<int, int> ObjectCounter::counts;

void ObjectCounter::incrementCount(int classId) {
    counts[classId]++;
}

void ObjectCounter::resetCounts() {
    counts.clear();
}

std::unordered_map<int, int> ObjectCounter::getCounts() {
    return counts;
}

void ObjectCounter::printCounts() {
    std::cout << "Object Counts:" << std::endl;
    for (const auto& pair : counts) {
        std::cout << "Class " << pair.first << ": " << pair.second << std::endl;
    }
}