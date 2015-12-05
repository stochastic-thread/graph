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
