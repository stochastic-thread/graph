defmodule Graph do
	defp init do
		fn -> :digraph.new end
		|> Agent.start_link name: __MODULE__
	end

	defp get_graph do
		Agent.get __MODULE__, fn _c -> _c end
	end

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

	def get do
		get_graph
	end

	def add_vertex vertex do
		:digraph.add_vertex(get_graph, vertex)
	end
end
