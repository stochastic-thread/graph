defmodule DigraphUtilsTest do
  use ExUnit.Case

  test "components" do
    graph = Graph.test_graph()
    correct_components = [:a,:b,:c,:d,:e,:f] 
    components = Enum.sort( hd :mdigraph_utils.components( graph ) )
    assert Enum.sort(correct_components) == components
  end

  test "strong components" do
    graph = Graph.test_graph()
    correct_components =  
      [[:a,:b,:c],[:d,:e,:f]]
    components = Enum.sort( :mdigraph_utils.strong_components( graph ) )
    assert correct_components == components
  end
end
