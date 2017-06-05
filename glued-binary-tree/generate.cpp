#include "graph.hpp"
#include <iostream>
#include <cstdlib>
#include <algorithm>
#include <vector>
#include <random>
#include <cmath>
#include <cassert>
using namespace std;

#define LEFT  0
#define RIGHT 1

template <class Generator>
size_t random_choose(Generator& engine, vector<size_t>& list)
{
  assert (list.size() > 0);
  uniform_int_distribution<size_t> dist(0, list.size() - 1);
  size_t index = dist(engine);
  size_t result = list[index];
  list.erase(list.begin() + index);
  return result;
}

void random_glued(int level, Graph& g)
{
  // initialize the random engine
  random_device rd;
  seed_seq seeds{rd(), rd(), rd(), rd(), rd(), rd()};
  mt19937 engine(seeds);

  size_t left_start = (1 << level) - 1;
  size_t right_start = (1 << (level + 1)) - 1;
  size_t count = (1 << level);
  vector<size_t> unused[2];
  for (size_t i = 0; i < count; ++i) {
    unused[LEFT].push_back(left_start + i);
    unused[RIGHT].push_back(right_start + i);
  }
  // randomly connect left leafs and right leafs
  size_t x = left_start;  // current vertex
  unused[LEFT].erase(unused[LEFT].begin());
  for (size_t i = 1; i <= count; ++i) {
    size_t y = random_choose(engine, unused[RIGHT]);
    assert(x != y);
    g[x].addNeighbour(y);
    g[y].addNeighbour(x);
    if (i == count) {
      x = left_start;   // side case
    } else {
      x = random_choose(engine, unused[LEFT]);
    }
    g[y].addNeighbour(x);
    g[x].addNeighbour(y);
  }
}


Graph generate(int level)
{
  size_t n = 2 * ((1 << (level + 1)) - 1);
  Graph g(n);
  // generate two binary trees
  for (size_t i = 1; i <= level; ++i) {
    size_t k = (1 << i);
    for (size_t j = 0; j < k; ++j) {
      // the left part
      size_t left = (1 << i) + j - 1;
      size_t left_parent = (left + 1) / 2 - 1;
      g[left].addNeighbour(left_parent);
      g[left_parent].addNeighbour(left);
      size_t right = (n - left - 1);
      size_t right_parent = (n - left_parent - 1);
      g[right].addNeighbour(right_parent);
      g[right_parent].addNeighbour(right);
    }
  }
  // glued two binary trees
  random_glued(level, g);
  // normalize the graph
  g.normalize();
  return g;
}


int main(int argc, char* argv[])
{
  if (argc < 2) {
    cerr << "Usage: " << argv[0] << " level" << endl;
    return -1;
  }
  int level = atoi(argv[1]);
  if (level < 1) {
    cerr << "The level must be greater than 1." << endl;
    return -1;
  }
  Graph g = generate(level);
  cout << g;
  return 0;
}