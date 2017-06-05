#include "graph.hpp"


int main()
{
  Graph g(7);
  for (size_t i = 1; i < 3; ++i) {
    size_t m = (1 << i);
    for (size_t j = 0; j < m; ++j) {
      size_t label = (1 << i) + j - 1;
      size_t parent = (label + 1) / 2 - 1;
      g[label].addNeighbour(parent);
      g[parent].addNeighbour(label);
    }
  }
  cout << g;
  return 0;
}