#include<iostream>
#include<queue>
#define MAX 10

using namespace std;

bool visited[MAX];
int matrix[MAX][MAX];



void addEdge(int v,int e){
    matrix[v][e]=1;
    matrix[e][v]=1;
    
}

void dfs(int start,int n){
visited[start]=true;
cout<<start<<" ";
for(int i=0;i<n;i++){
    if(matrix[start][i]==1 && visited[i]!=1){
        dfs(i,n);
    }
}

}

void bfs(int start,int n){
    for(int i=0;i<MAX;i++){
        visited[i]=false;
    }
    queue<int> q;
    visited[start]=true;
    q.push(start);
    while(!q.empty()){
        int v = q.front();
        q.pop();
        cout<<v<<" ";
        for(int i=0;i<n;i++){
            if(matrix[v][i]==1 && visited[i]!=1){
                visited[i]=true;
                q.push(i);
            }
        }
    }
}

int main(){
    
    
 addEdge(0, 1);
    addEdge(0, 2);
    addEdge(1, 3);
    addEdge(2, 4);
        dfs(0, 6);
        cout<<"\n";
        bfs(0,5);
    return 0;
}