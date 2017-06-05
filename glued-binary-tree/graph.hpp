/**
 *  \file graph.hpp
 *  \brief Defines data structure of graphs.
 *
 *  \author Haixing Hu
 *  Copyright (c) 2017 Haixing Hu. All rights reserved.
 */
#ifndef _GRAPH_HPP_
#define _GRAPH_HPP_
////////////////////////////////////////////////////////////////////////////////

#include <cstddef>
#include <vector>
#include <string>
#include <iostream>
#include <sstream>
#include <algorithm>
#include <cstdlib>
using namespace std;


class Node {
public:
  Node() throw () {}

  Node(size_t label) {
    this->label = label;
  }

  size_t getLabel() const {
    return label;
  }

  vector<size_t>& getNeighbours() {
    return neighbours;
  }

  vector<size_t> const& getNeighbours() const {
    return neighbours;
  }

  void addNeighbour(size_t label) {
    neighbours.push_back(label);
  }

  bool operator<(Node const& other) const {
    return (label < other.label);
  }

  friend ostream& operator<<(ostream& out, Node const& node) {
    out << node.label << " ";
    for (auto iter = node.neighbours.begin(); iter != node.neighbours.end(); ++iter) {
      out << *iter << " ";
    }
    out << endl;
    return out;
  }

  friend istream& operator>>(istream& in, Node& node) {
    string line;
    in >> node.label;
    size_t v;
    while (in >> v) {
      node.neighbours.push_back(v);
    }
    return in;
  }

private:
  size_t               label;
  vector<size_t>       neighbours;
};



class Graph {
public:

  Graph() throw () {};

  Graph(size_t n) {
    for (size_t i = 0; i < n; ++i) {
      addNode();
    }
  }

  size_t size() {
    return nodes.size();
  }

  Node& operator[](size_t label) {
    return nodes[label];
  }

  Node const& operator[](size_t label) const {
    return nodes[label];
  }

  vector<Node>& getNodes() {
    return nodes;
  }

  vector<Node> const& getNodes() const {
    return nodes;
  }

  vector<Node>::iterator begin() {
    return nodes.begin();
  }

  vector<Node>::const_iterator begin() const {
    return nodes.begin();
  }

  vector<Node>::iterator end() {
    return nodes.end();
  }

  vector<Node>::const_iterator end() const {
    return nodes.end();
  }

  Graph& addNode() {
    Node node(nodes.size());
    nodes.push_back(node);
    return *this;
  }

  Graph& resize(size_t n) {
    if (n < nodes.size()) {
      nodes.resize(n);
    } else if (n > nodes.size()) {
      size_t m = nodes.size() - n;
      for (size_t i = 0; i < m; ++i) {
        addNode();
      }
    }
    return *this;
  }

  Graph& normalize() {
    sort(nodes.begin(), nodes.end());
    for (auto iter = nodes.begin(); iter != nodes.end(); ++iter) {
      vector<size_t>& neighbours = iter->getNeighbours();
      sort(neighbours.begin(), neighbours.end());
    }
    return *this;
  }

  Graph& clear() {
    nodes.clear();
    return *this;
  }

  friend ostream& operator<<(ostream& out, Graph const& g) {
    for (auto iter = g.nodes.begin(); iter != g.nodes.end(); ++iter) {
      out << *iter;
    }
    return out;
  }

  friend istream& operator>>(istream& in, Graph& g) {
    g.clear();
    string line;
    while (getline(in, line)) {
      istringstream is(line);
      Node node;
      is >> node;
      g.nodes.push_back(node);
    }
    g.normalize();
    return in;
  }

private:
  vector<Node>    nodes;
};

////////////////////////////////////////////////////////////////////////////////
#endif // _GRAPH_HPP_
