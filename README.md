# Graph

**High-performance, distributed graph library for Elixir**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add graph to your list of dependencies in `mix.exs`:

        def deps do
          [{:graph, "~> 0.0.1"}]
        end

  2. Ensure graph is started before your application:

        def application do
          [applications: [:graph]]
        end

## Sample Usage

```
Interactive Elixir (1.1.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> graph = Graph.new!
#PID<0.95.0>
iex(2)> Graph.add_vertex( graph, 1, %{data: "arthur colle"} )
1
iex(3)> Graph.add_vertex( graph, 2, %{data: "sophie colle"} )
2
iex(4)> Graph.vertices( graph )
[1, 2]
iex(5)> Graph.show( graph )
{1, %{data: "arthur colle"}}
{2, %{data: "sophie colle"}}
:ok
iex(6)> Graph.edges( graph )
[]
iex(7)> Graph.add_edge( graph, :a, 1, 2, %{relationship: :siblings} )
:a

iex(8)> Graph.edge!( graph, :a )
%{relationship: :siblings}

iex(5)> Graph.show( graph )
{1, %{data: "arthur colle"}}
{2, %{data: "sophie colle"}}
%{relationship: :siblings}

```

#To do from `:digraph_utils`:

```
arborescence_root/1           components/1
condensation/1                cyclic_strong_components/1
is_acyclic/1                  is_arborescence/1
is_tree/1                     loop_vertices/1
module_info/0                 module_info/1
postorder/1                   preorder/1
reachable/2                   reachable_neighbours/2
reaching/2                    reaching_neighbours/2
strong_components/1           subgraph/2
subgraph/3                    topsort/1
```

#To do from `:digraph`:
```
del_edge/2           del_edges/2          del_path/3
del_vertex/2         del_vertices/2       delete/1
edge/2               edges/2
get_cycle/2          get_path/3           get_short_cycle/2
get_short_path/3     in_degree/2          in_edges/2
in_neighbours/2      info/1               module_info/0
module_info/1        new/0                new/1
no_edges/1           no_vertices/1        out_degree/2
out_edges/2          out_neighbours/2     sink_vertices/1
source_vertices/1    vertex/2             vertices/1
```
#Done from `:digraph`:
~~`add_edge/3`~~           
~~`add_edge/4`~~           
~~`add_edge/5`~~ 

~~`add_vertex/1`~~         
~~`add_vertex/2`~~         
~~`add_vertex/3`~~

~~`edges/1`~~

# Info for maintainers:

## :digraph module functions
```
add_edge(G, V1, V2) -> edge() | {error, add_edge_err_rsn()}
add_edge(G, V1, V2, Label) -> edge() | {error, add_edge_err_rsn()}
add_edge(G, E, V1, V2, Label) -> edge() | {error, add_edge_err_rsn()}
add_vertex(G) -> vertex()
add_vertex(G, V) -> vertex()
add_vertex(G, V, Label) -> vertex()
del_edge(G, E) -> true
del_edges(G, Edges) -> true
del_path(G, V1, V2) -> true
del_vertex(G, V) -> true
del_vertices(G, Vertices) -> true
delete(G) -> true
edge(G, E) -> {E, V1, V2, Label} | false
edges(G) -> Edges
edges(G, V) -> Edges
get_cycle(G, V) -> Vertices | false
get_path(G, V1, V2) -> Vertices | false
get_short_cycle(G, V) -> Vertices | false
get_short_path(G, V1, V2) -> Vertices | false
in_degree(G, V) -> integer() >= 0
in_edges(G, V) -> Edges
in_neighbours(G, V) -> Vertex
info(G) -> InfoList
new() -> graph()
new(Type) -> graph()
no_edges(G) -> integer() >= 0
no_vertices(G) -> integer() >= 0
out_degree(G, V) -> integer() >= 0
out_edges(G, V) -> Edges
out_neighbours(G, V) -> Vertices
vertex(G, V) -> {V, Label} | false
vertices(G) -> Vertices
```

## :digraph_utils module functions
```
arborescence_root(Digraph) -> no | {yes, Root}
components(Digraph) -> [Component]
condensation(Digraph) -> CondensedDigraph
cyclic_strong_components(Digraph) -> [StrongComponent]
is_acyclic(Digraph) -> boolean()
is_arborescence(Digraph) -> boolean()
is_tree(Digraph) -> boolean()
loop_vertices(Digraph) -> Vertices
postorder(Digraph) -> Vertices
preorder(Digraph) -> Vertices
reachable(Vertices, Digraph) -> Reachable
reachable_neighbours(Vertices, Digraph) -> Reachable
reaching(Vertices, Digraph) -> Reaching
reaching_neighbours(Vertices, Digraph) -> Reaching
strong_components(Digraph) -> [StrongComponent]
subgraph(Digraph, Vertices) -> SubGraph
subgraph(Digraph, Vertices, Options) -> SubGraph
topsort(Digraph) -> Vertices | false
```