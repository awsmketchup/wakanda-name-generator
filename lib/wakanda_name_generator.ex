defmodule WakandaNameGenerator do
	use Application

	def start(_type, _args) do
		import Supervisor.Spec, warn: false

		children = [
			{Registry, keys: :unique, name: Registry.WakandaNameGenerator},
			{DynamicSupervisor, name: WakandaNameGenerator.NameGenSupervisor, strategy: :one_for_one}
		]

		opts = [
			strategy: :one_for_one,
			name: WakandaNameGenerator.Supervisor
		]

		Supervisor.start_link(children, opts)
	end
end
