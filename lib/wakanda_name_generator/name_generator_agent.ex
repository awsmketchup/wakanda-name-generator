defmodule WakandaNameGenerator.NameGenAgent do
	use Agent
	alias Registry.WakandaNameGenerator

	def start_link(id) do
		Agent.start_link(fn() -> [] end, name: via_tuple(id))
	end

	def update_state(id, name) do
		Agent.update(via_tuple(id), & &1 ++ [name])
	end

	def get_state(id), do: Agent.get(via_tuple(id), fn(state) -> state end)

	defp via_tuple(id) do
		{:via, Registry, {WakandaNameGenerator, id }}
	end
end
