#include "graph.hpp"
#include <iostream>
#include <random>
#include <cassert>
using namespace std;

template <class Generator>
size_t random_choose(Generator& engine, vector<size_t> const& list)
{
  assert (list.size() > 0);
  uniform_int_distribution<size_t> dist(0, list.size() - 1);
  size_t index = dist(engine);
  return list[index];
}

template <class Generator>
size_t random_walk(Generator& engine, Graph const& g, size_t source, size_t dest)
{
  size_t steps = 0;
  size_t current = source;
  while (current != dest) {
    size_t next = random_choose(engine, g[current].getNeighbours());
    assert(next != current);
    ++steps;
    current = next;
  }
  return steps;
}

int main()
{
  Graph g;
  cin >> g;

  random_device rd;
  seed_seq seeds{rd(), rd(), rd(), rd(), rd(), rd()};
  mt19937 engine(seeds);
  size_t steps = random_walk(engine, g, 0, g.size() - 1);
  cout << steps << endl;
  return 0;
}