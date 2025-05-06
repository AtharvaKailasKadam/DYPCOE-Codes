#include<bits/stdc++.h>
using namespace std;
const int max = INT_MAX;

class Graph {
    int **adjMatix;
    int vertexCount;
    int edgeCount;
    map<string, int> cities;
    map<int, string> inv_cities;

    void add(string city1, string city2, int dist) {
        adjMatix[cities[city1]][cities[city2]] = dist;
        adjMatix[cities[city2]][cities[city1]] = dist;
    }

    int minimum_key(int key[], bool mst[]) {
        int minimum = INT_MAX, min, i;
        for (i = 0; i < vertexCount; i++)
            if (mst[i] == 0 && key[i] < minimum) {
                minimum = key[i];
                min = i;
            }
        return min;
    }

public:
    Graph() {
        cout << "Enter number of Vertices: ";
        cin >> vertexCount;
        cout << "Enter number of edges: ";
        cin >> edgeCount;
        adjMatix = new int*[vertexCount];
        for (int i = 0; i < vertexCount; i++) {
            adjMatix[i] = new int[vertexCount];
            for (int j = 0; j < vertexCount; j++) adjMatix[i][j] = 0;
        }
        cout << "Add cities in order: " << endl;
        for (int i = 0; i < vertexCount; i++) {
            string city;
            cin >> city;
            cities[city] = i;
            inv_cities[i] = city;
        }
        cout << "Add the " << edgeCount << " edges" << endl;
        for (int i = 0; i < edgeCount; i++) {
            string u, v;
            int d;
            cout << "City 1: ";
            cin >> u;
            cout << "City 2: ";
            cin >> v;
            cout << "Distance: ";
            cin >> d;
            add(u, v, d);
        }
    }

    void prim(Graph g) {
        int n = g.vertexCount;
        int parent[n], key[n];
        bool mst[n];
        for (int i = 0; i < n; i++) {
            key[i] = INT_MAX;
            mst[i] = 0;
        }
        key[0] = 0;
        parent[0] = -1;
        for (int count = 0; count < n - 1; count++) {
            int min_edge_vertex = minimum_key(key, mst);
            mst[min_edge_vertex] = 1;
            for (int vertex = 0; vertex < n; vertex++) {
                if (g.adjMatix[min_edge_vertex][vertex] && mst[vertex] == 0 && g.adjMatix[min_edge_vertex][vertex] < key[vertex]) {
                    parent[vertex] = min_edge_vertex;
                    key[vertex] = g.adjMatix[min_edge_vertex][vertex];
                }
            }
        }
        cout << "MST of given graph is: \n\nEdge \t Weight\n";
        for (int i = 1; i < n; i++) {
            cout << inv_cities[parent[i]] << " <-> " << inv_cities[i] << " \t " << g.adjMatix[i][parent[i]] << endl;
        }
    }
};

int main() {
    Graph g;
    g.prim(g);
    return 0;
}
