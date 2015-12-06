defmodule GraphTest do
  use ExUnit.Case
  doctest Graph

  def test_graph do
  	# A --> D
    # A --> B --> C --> A
    # D --> E --> F --> D
  	graph = :digraph.new
    :digraph.add_vertex graph, :a, 1
    :digraph.add_vertex graph, :b, 2
    :digraph.add_vertex graph, :c, 3
    :digraph.add_vertex graph, :d, 4
    :digraph.add_vertex graph, :e, 5
    :digraph.add_vertex graph, :f, 6
    :digraph.add_edge graph, :ab, :a, :b, "AB"
    :digraph.add_edge graph, :bc, :b, :c, "BC"
    :digraph.add_edge graph, :ca, :c, :a, "CA"
    :digraph.add_edge graph, :de, :d, :e, "DE"
    :digraph.add_edge graph, :ef, :e, :f, "EF"
    :digraph.add_edge graph, :fd, :f, :d, "FD"
    :digraph.add_edge graph, :ad, :a, :d, "AD"    
    graph
  end

  test "components" do
    graph = Graph.test_graph()
    correct_components = [:a,:b,:c,:d,:e,:f] 
    components = Enum.sort( hd :digraph_utils.components( graph ) )
    assert Enum.sort(correct_components) == components
  end

  test "strong components" do
  	graph = Graph.test_graph()
  	correct_components =  
  		[[:a,:b,:c],[:d,:e,:f]]
    components = Enum.sort( :digraph_utils.strong_components( graph ) )
    assert correct_components == components
  end
end
