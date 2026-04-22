import heapq

def dijkstra(graph, source):
    dist = {node: float('inf') for node in graph}
    dist[source] = 0

    pq = [(0, source)]

    while pq:
        current_dist, u = heapq.heappop(pq)

        if current_dist > dist[u]:
            continue

        for v, weight in graph[u]:
            distance = current_dist + weight

            if distance < dist[v]:
                dist[v] = distance
                heapq.heappush(pq, (distance, v))

    return dist


graph = {
    0: [(1, 4), (2, 1)],
    1: [(3, 1)],
    2: [(1, 2), (3, 5)],
    3: []
}

source = 0
distances = dijkstra(graph, source)

print("Shortest distances from source:")
for node in distances:
    print(f"{source} -> {node} = {distances[node]}")