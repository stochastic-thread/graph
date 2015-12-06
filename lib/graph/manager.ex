defmodule Graph.Manager do
	use Supervisor
	defstruct graphs: []

	def start_link do
		Supervisor.start_link( __MODULE__, :ok )
	end
end