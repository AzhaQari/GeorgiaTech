import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Set;

/**
 * Your implementation of various different graph algorithms.
 *
 * @author Azha Qari
 * @userid aqari3
 * @GTID 903481053
 * @version 1.0
 */
public class GraphAlgorithms {

    /**
     * Performs a breadth first search (bfs) on the input graph, starting at
     * the parameterized starting vertex.
     *
     * When exploring a vertex, explore in the order of neighbors returned by
     * the adjacency list. Failure to do so may cause you to lose points.
     *
     * You may import/use java.util.Set, java.util.List, java.util.Queue, and
     * any classes that implement the aforementioned interfaces, as long as they
     * are efficient.
     *
     * The only instance of java.util.Map that you may use is the
     * adjacency list from graph. DO NOT create new instances of Map
     * for BFS (storing the adjacency list in a variable is fine).
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * @param <T>   the generic typing of the data
     * @param start the vertex to begin the bfs on
     * @param graph the graph to search through
     * @return list of vertices in visited order
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph
     */
    public static <T> List<Vertex<T>> bfs(Vertex<T> start, Graph<T> graph) {
        if (graph == null) {
            throw new IllegalArgumentException("The graph cannot be null.");
        }

        if (start == null) {
            throw new IllegalArgumentException("The start node cannot be null.");
        }

        if (!(graph.getVertices().contains(start))) {
            throw new IllegalArgumentException("The graph does not contain the vertex.");
        }

        Queue<Vertex<T>> queue = new LinkedList<>();
        Set<Vertex<T>> visited = new HashSet<>();
        List<Vertex<T>> list = new ArrayList<>();

        list.add(start);
        queue.add(start);
        visited.add(start);

        while (!(queue.isEmpty())) {
            Vertex<T> current = queue.remove();
            List<VertexDistance<T>> adjList = graph.getAdjList().get(current);

            for (VertexDistance<T> e: adjList) {
                Vertex<T> t = e.getVertex();

                if (!(visited.contains(t))) {
                    visited.add(t);
                    list.add(t);
                    queue.add(t);
                }
            }
        }
        return list;
    }

    /**
     * Performs a depth first search (dfs) on the input graph, starting at
     * the parameterized starting vertex.
     *
     * When exploring a vertex, explore in the order of neighbors returned by
     * the adjacency list. Failure to do so may cause you to lose points.
     *
     * *NOTE* You MUST implement this method recursively, or else you will lose
     * all points for this method.
     *
     * You may import/use java.util.Set, java.util.List, and
     * any classes that implement the aforementioned interfaces, as long as they
     * are efficient.
     *
     * The only instance of java.util.Map that you may use is the
     * adjacency list from graph. DO NOT create new instances of Map
     * for DFS (storing the adjacency list in a variable is fine).
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * @param <T>   the generic typing of the data
     * @param start the vertex to begin the dfs on
     * @param graph the graph to search through
     * @return list of vertices in visited order
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph
     */
    public static <T> List<Vertex<T>> dfs(Vertex<T> start, Graph<T> graph) {
        if (graph == null) {
            throw new IllegalArgumentException("The graph cannot be null.");
        }

        if (start == null) {
            throw new IllegalArgumentException("The start node cannot be null.");
        }

        if (!(graph.getVertices().contains(start))) {
            throw new IllegalArgumentException("The graph does not contain the vertex.");
        }

        Set<Vertex<T>> visited = new HashSet<>();
        List<Vertex<T>> list = new ArrayList<>();

        dfs(start, graph, visited, list);
        return list;
    }

    /**
     * The helper method to do a DFS
     * @param curr the current Vertex being recursed through
     * @param graph a connection of vertices and weighted edges
     * @param visited a list containing the visited nodes
     * @param list the returned list
     * @param <T> a generic data type
     */
    private static <T> void dfs(Vertex<T> curr, Graph<T> graph, Set<Vertex<T>> visited, List<Vertex<T>> list) {
        if (!(visited.contains(curr))) {
            visited.add(curr);
            list.add(curr);

            List<VertexDistance<T>> adjList = graph.getAdjList().get(curr);
            for (VertexDistance<T> vertex: adjList) {
                if (!(visited.contains(vertex.getVertex()))) {
                    dfs(vertex.getVertex(), graph, visited, list);
                }
            }
        }
    }

    /**
     * Finds the single-source shortest distance between the start vertex and
     * all vertices given a weighted graph (you may assume non-negative edge
     * weights).
     *
     * Return a map of the shortest distances such that the key of each entry
     * is a node in the graph and the value for the key is the shortest distance
     * to that node from start, or Integer.MAX_VALUE (representing
     * infinity) if no path exists.
     *
     * You may import/use java.util.PriorityQueue,
     * java.util.Map, and java.util.Set and any class that
     * implements the aforementioned interfaces, as long as your use of it
     * is efficient as possible.
     *
     * You should implement the version of Dijkstra's where you use two
     * termination conditions in conjunction.
     *
     * 1) Check if all of the vertices have been visited.
     * 2) Check if the PQ is empty.
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * @param <T>   the generic typing of the data
     * @param start the vertex to begin the Dijkstra's on (source)
     * @param graph the graph we are applying Dijkstra's to
     * @return a map of the shortest distances from start to every
     * other node in the graph
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph.
     */
    public static <T> Map<Vertex<T>, Integer> dijkstras(Vertex<T> start,
                                                        Graph<T> graph) {
        if (graph == null) {
            throw new IllegalArgumentException("The graph cannot be null.");
        }

        if (start == null) {
            throw new IllegalArgumentException("The start node cannot be null.");
        }

        if (!(graph.getVertices().contains(start))) {
            throw new IllegalArgumentException("The graph does not contain the vertex.");
        }


        Set<Vertex<T>> visit = new HashSet<>();
        Queue<VertexDistance<T>> queue = new PriorityQueue<>();
        Map<Vertex<T>, Integer> returnMap = new HashMap<>();

        queue.add(new VertexDistance<T>(start, 0));

        for (Vertex<T> vertex: graph.getAdjList().keySet()) {
            if (!start.equals(vertex)) {
                returnMap.put(vertex, Integer.MAX_VALUE);
            } else {
                returnMap.put(start, 0);
            }
        }

        while (!(graph.getVertices().size() == visit.size()) && !(queue.isEmpty())) {

            VertexDistance<T> currentDistance = queue.remove();
            Vertex<T> current = currentDistance.getVertex();

            if (!(visit.contains(current))) {
                visit.add(current);
                List<VertexDistance<T>> adjList = graph.getAdjList().get(current);
                for (VertexDistance<T> e: adjList) {
                    if (!(visit.contains(e.getVertex()))
                            && (currentDistance.getDistance() + e.getDistance() < returnMap.get(e.getVertex()))) {
                        queue.add(new VertexDistance<>(e.getVertex(), e.getDistance() + currentDistance.getDistance()));
                        returnMap.put(e.getVertex(), e.getDistance() + currentDistance.getDistance());
                    }
                }

            }
        }
        return returnMap;
    }

    /**
     * Runs Prim's algorithm on the given graph and returns the Minimum
     * Spanning Tree (MST) in the form of a set of Edges. If the graph is
     * disconnected and therefore no valid MST exists, return null.
     *
     * You may assume that the passed in graph is undirected. In this framework,
     * this means that if (u, v, 3) is in the graph, then the opposite edge
     * (v, u, 3) will also be in the graph, though as a separate Edge object.
     *
     * The returned set of edges should form an undirected graph. This means
     * that every time you add an edge to your return set, you should add the
     * reverse edge to the set as well. This is for testing purposes. This
     * reverse edge does not need to be the one from the graph itself; you can
     * just make a new edge object representing the reverse edge.
     *
     * You may assume that there will only be one valid MST that can be formed.
     *
     * You should NOT allow self-loops or parallel edges in the MST.
     *
     * You may import/use PriorityQueue, java.util.Set, and any class that
     * implements the aforementioned interface.
     *
     * DO NOT modify the structure of the graph. The graph should be unmodified
     * after this method terminates.
     *
     * The only instance of java.util.Map that you may use is the
     * adjacency list from graph. DO NOT create new instances of Map
     * for this method (storing the adjacency list in a variable is fine).
     *
     * @param <T> the generic typing of the data
     * @param start the vertex to begin Prims on
     * @param graph the graph we are applying Prims to
     * @return the MST of the graph or null if there is no valid MST
     * @throws IllegalArgumentException if any input is null, or if start
     *                                  doesn't exist in the graph.
     */
    public static <T> Set<Edge<T>> prims(Vertex<T> start, Graph<T> graph) {
        if (graph == null) {
            throw new IllegalArgumentException("The graph cannot be null.");
        }

        if (start == null) {
            throw new IllegalArgumentException("The start node cannot be null.");
        }

        if (!(graph.getVertices().contains(start))) {
            throw new IllegalArgumentException("The graph does not contain the vertex.");
        }

        Map<Vertex<T>, List<VertexDistance<T>>> adjList = graph.getAdjList();
        Queue<Edge<T>> queue = new PriorityQueue<>();

        Set<Vertex<T>> hash1 = new HashSet<>();
        Set<Edge<T>> hash2 = new HashSet<>();

        for (VertexDistance<T> vertexDistance : adjList.get(start)) {
            queue.add(new Edge<>(start, vertexDistance.getVertex(), vertexDistance.getDistance()));
        }

        hash1.add(start);
        while (!queue.isEmpty()) {
            Edge<T> curr = queue.remove();
            if (!hash1.contains(curr.getU())) {
                hash2.add(curr);
                hash2.add(new Edge<>(curr.getV(), curr.getU(), curr.getWeight()));
                hash1.add(curr.getV());

                for (VertexDistance<T> vertexDistance : adjList.get(curr.getV())) {
                    queue.add(new Edge<>(curr.getV(), vertexDistance.getVertex(), vertexDistance.getDistance()));
                }
            }
            if (!(hash1.contains(curr.getV()))) {
                hash2.add(curr);
                hash2.add(new Edge<>(curr.getV(), curr.getU(), curr.getWeight()));
                hash1.add(curr.getV());

                for (VertexDistance<T> vertexDistance : adjList.get(curr.getV())) {
                    queue.add(new Edge<>(curr.getV(), vertexDistance.getVertex(), vertexDistance.getDistance()));
                }
            }
        }

        if (adjList.size() > hash1.size() + 1) {
            return null;
        }

        return hash2;
    }
}