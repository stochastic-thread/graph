defmodule Graph do

	# Private helper functions
	
	# initializes the :digraph from otp, holds its state with an agent
	defp init do
		fn -> :digraph.new end 
		|> Agent.start_link
	end

	# new - client creates an Agent holding a :digraph
	def new do
		case init do
			{:ok, _pid} 
				-> {:ok, _pid}
			{:error, _else} 
				-> {:error, _else}
			_anything_else 
				-> {:unknown_error, _anything_else}
		end
	end

	# new! - get the pid and not a status tuple
	def new! do
		case init do
			{:ok, _pid} 
				-> _pid
			{:error, _else}
				-> _else
		end
	end

	def vertices(pid) do
		Agent.get pid, fn x -> :digraph.vertices x end
	end

	def add_vertex(pid) do
		Agent.get pid, fn x -> :digraph.add_vertex x end
	end

	def add_vertex(pid, k) do
		Agent.get pid, fn x -> :digraph.add_vertex x, k end
	end

	def add_vertex(pid, k, v) do
		Agent.get pid, fn x -> :digraph.add_vertex(x, k, v) end
	end

	def edges(pid) do
		Agent.get pid, fn x -> :digraph.edges x end
	end

	def add_edge(pid, ek, v1k, v2k, ev) do
		Agent.get pid, fn x -> :digraph.add_edge(pid, ek, v1k, v2k, ev) end
	end

end
