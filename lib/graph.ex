defmodule Graph do

  ############ Private functions ##############################

  defp init do
    :mnesia.start()
    Agent.start_link( fn -> 
      :mdigraph.new 
    end )
  end
  
  ############ Public functions ###############################

  # new/0   - client creates an Agent holding a :mdigraph
  # 
  # notes - use when you need to catch errors, e.g. by 
  #					matching on `{response_code, pid} = Graph.new`

  def new do
    case init() do
      {:ok, pid} -> 
        {:ok, pid}
      {:error, error} -> 
        {:error, error}
      anything_else ->
        {:unknown_error, anything_else}
    end
  end

  # new!/0 - get the pid directly and not a status tuple

  def new! do
    case init() do
      {:ok, pid} 
        -> pid
      {:error, error}
        -> error
		end
	end

  ############ Vertex functions ################################

  def vertex( graph_pid, key ) do
    Agent.get( graph_pid, fn graph -> 
      :mdigraph.vertex( graph, key ) 
    end )
  end

  # notes - just returns the value, not the {:key, :value} tuple  
  def vertex!( graph_pid, key ) do
    Agent.get( graph_pid, 
      fn graph ->
        {_x, y} = :mdigraph.vertex( graph, key ) 
        y
      end 
    )
  end

  def add_vertex( graph_pid ) do
    Agent.get( graph_pid, fn graph -> 
      :mdigraph.add_vertex( graph ) 
    end )
  end

  def add_vertex( graph_pid, key ) do
    Agent.get( graph_pid, fn graph -> 
      :mdigraph.add_vertex( graph, key ) 
    end )
  end
	
  def add_vertex( graph_pid, key, value ) do
    Agent.get( graph_pid, fn graph -> 
      :mdigraph.add_vertex( graph, key, value ) 
    end )
  end
	
  def vertices( graph_pid ) do
    Agent.get( graph_pid, fn graph -> 
      :mdigraph.vertices( graph ) 
    end )
  end

  ############ Edge functions ##################################

  def edge( graph_pid, key ) do
    Agent.get( graph_pid, fn graph -> 
      :mdigraph.edge( graph, key ) 
    end )
  end

  def edge!( graph_pid, key ) do
    Agent.get( graph_pid, 
      fn graph ->
        case :mdigraph.edge( graph, key ) do
          {x, y} -> y
          tuple -> 
            tuple 
            |> Tuple.to_list 
            |> Enum.fetch! 3
        end
      end 
    )
  end
	
  def add_edge( graph_pid, edge_k, v1_k, v2_k, edge_v ) do
    Agent.get( graph_pid, fn( graph ) -> 
      :mdigraph.add_edge( graph, edge_k, v1_k, v2_k, edge_v ) 
    end )
  end
	
  def edges( graph_pid ) do
    Agent.get( graph_pid, fn( graph ) -> 
      :mdigraph.edges( graph ) 
    end )
  end


  ############ Other functions #######################################
  def show( g ) do
    Enum.each(Graph.vertices( g ), 
      fn( v ) -> 
        IO.inspect Graph.vertex( g, v ) 
      end )
    Enum.each(Graph.edges( g ), 
      fn( e ) -> 
        IO.inspect Graph.edge( g, e ) 
      end )
  end

  def get!( graph_pid ) do
    Agent.get( graph_pid, 
      fn( graph ) -> graph 
    end )
  end

  def test_graph do
    # A --> D
    # A --> B --> C --> A
    # D --> E --> F --> D
    graph = :mdigraph.new
    :mdigraph.add_vertex graph, :a, 1
    :mdigraph.add_vertex graph, :b, 2
    :mdigraph.add_vertex graph, :c, 3
    :mdigraph.add_vertex graph, :d, 4
    :mdigraph.add_vertex graph, :e, 5
    :mdigraph.add_vertex graph, :f, 6
    :mdigraph.add_edge graph, :ab, :a, :b, "AB"
    :mdigraph.add_edge graph, :bc, :b, :c, "BC"
    :mdigraph.add_edge graph, :ca, :c, :a, "CA"
    :mdigraph.add_edge graph, :de, :d, :e, "DE"
    :mdigraph.add_edge graph, :ef, :e, :f, "EF"
    :mdigraph.add_edge graph, :fd, :f, :d, "FD"
    :mdigraph.add_edge graph, :ad, :a, :d, "AD"    
    graph
  end

end