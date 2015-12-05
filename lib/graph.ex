defmodule Graph do
	
	###################################################################
	# (private) 
	#
	# init/0  -  initializes the :digraph from otp, 
	#				     holds its state with an agent

	defp init do
		Agent.start_link(fn -> :digraph.new end
	end


	###################################################################
	# (public)
	#
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


	###################################################################
	# (public)
	#
	# new!/0 - get the pid directly and not a status tuple
	#

	def new! do
		case init() do
			{:ok, pid} 
				-> pid
			{:error, error}
				-> error
		end
	end


	###################################################################
	# (public)
	#

	def vertices(pid) do
		Agent.get(pid, fn(graph) -> :digraph.vertices(graph) end)
	end


	###################################################################
	# (public)
	#

	def add_vertex(graph_pid) do
		Agent.get(graph_pid, fn graph -> :digraph.add_vertex(graph) end)
	end


	###################################################################
	# (public)
	#

	def add_vertex(graph_pid, key) do
		Agent.get(graph_pid, fn graph -> :digraph.add_vertex(graph, key) end)
	end
	

	###################################################################
	# (public)
	#
	
	def add_vertex(graph_pid, key, value) do
		Agent.get(graph_pid, fn graph -> :digraph.add_vertex(graph, key, value) end)
	end
	

	###################################################################
	# (public)
	#
	
	def edges(graph_pid) do
		Agent.get(graph_pid, fn graph -> :digraph.edges(graph) end)
	end
	

	###################################################################
	# (public)
	#
	
	def add_edge(graph_pid, edge_k, v1_k, v2_k, edge_v) do
		Agent.get( graph_pid, 
			fn graph -> 
				:digraph.add_edge( graph, edge_k, v1_k, v2_k, edge_v) 
			end
		)
	end
	

	###################################################################
	# (public)
	#
	
	def edge(graph_pid, key) do
		Agent.get( graph_pid, fn graph -> :digraph.edge(graph, key) end )
	end
	

	###################################################################
	# (public)
	#
	
	def vertex(graph_pid, key) do
		Agent.get( graph_pid, fn graph -> :digraph.vertex(graph, key) end )
	end

end
