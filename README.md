# Graph

**Wrapper around Erlang's :digraph module**

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




```
Interactive Elixir (1.1.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> g = Graph.new!
#PID<0.116.0>

iex(2)> Graph.add_vertex g, :a, %{name: "Arthur Colle"}
:a

iex(3)> Graph.add_vertex g, :j, %{name: "Martina Miller"}
:m

iex(4)> Graph.vertices g
[:m, :a]

iex(5)> Graph.add_edge(g, :edge1, :a, :m, %{status: "Met Once"})
:edge1

iex(6)> Graph.show g
{:m, %{name: "Martina Miller"}}
{:a, %{name: "Arthur Colle"}}
{:edge1, :a, :m, %{status: "Met Once"}}
```