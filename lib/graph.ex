defmodule Graph do

  ############ Private functions ##############################

  defp init do
    Agent.start_link(fn -> :digraph.new end)
  end
  
  ############ Public functions ###############################

  # new/0   - client creates an Agent holding a :digraph
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

  def vertex(graph_pid, key) do
    Agent.get( graph_pid, fn graph -> :digraph.vertex(graph, key) end )
  end

  # notes - just returns the value, not the {:key, :value} tuple  
  def vertex!(graph_pid, key) do
    Agent.get( graph_pid, 
      fn graph ->
        {x, y} = :digraph.vertex(graph, key) 
        y
      end 
    )
  end

  def add_vertex graph_pid do
    Agent.get graph_pid, fn graph -> graph |> :digraph.add_vertex end
  end

  def add_vertex graph_pid, key do
    Agent.get graph_pid, fn graph -> (graph |> :digraph.add_vertex key) end
	end
	
	def add_vertex graph_pid, key, value do
		Agent.get graph_pid, fn graph ->  (graph |> :digraph.add_vertex key, value) end
	end
	
  def vertices graph_pid do
    Agent.get graph_pid, fn graph -> graph |> :digraph.vertices end
  end

  ############ Edge functions ##################################

  def edge(graph_pid, key) do
    Agent.get( graph_pid, fn graph -> :digraph.edge(graph, key) end )
  end

  def edge!(graph_pid, key) do
    Agent.get( graph_pid, 
      fn graph ->
        case :digraph.edge(graph, key) do
          {x, y} -> y
          other_msg -> other_msg
        end
      end 
    )
  end
	
	def add_edge graph_pid, edge_k, v1_k, v2_k, edge_v do
    Agent.get( graph_pid, fn graph -> :digraph.add_edge(graph, edge_k, v1_k, v2_k, edge_v) end)
	end
	
  def edges graph_pid do
    Agent.get graph_pid, fn graph -> :digraph.edges(graph) end
  end


  ###################################################################
  # show/1
  # 
  # notes - for graphical view of vertices/edges
  #         also debugging
  
  def show(g) do
    Enum.each(Graph.vertices(g), fn(v) -> IO.inspect Graph.vertex(g, v) end)
    Enum.each(Graph.edges(g), fn(e) -> IO.inspect Graph.edge(g, e) end)
  end

end