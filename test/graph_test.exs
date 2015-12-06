defmodule GraphTest do
  use ExUnit.Case
  doctest Graph

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
