defmodule WakandaNameGenerator.NameGenerator do
	@moduledoc """
	Documentation for WakandaNameGenerator.
	"""

	alias WakandaNameGenerator.WakandaNameKey
	alias WakandaNameGenerator.NameGenSupervisor
	alias WakandaNameGenerator.NameGenAgent

	def gen_name(name) do
		DynamicSupervisor.start_child(NameGenSupervisor, { NameGenAgent, name })

		name
		|> split_string(" ")
		|> match_name(name)
	end

	defp match_name([], name), do: NameGenAgent.get_state(name) |> to_name()
	defp match_name([current_name | next_names], name) do
		char_list = split_string(current_name)
		NameGenAgent.update_state(name, match_char(char_list))
		match_name(next_names, name)
	end

	defp match_char(wakanda_name, []), do: wakanda_name
	defp match_char(wakanda_name, [current_char | remaining_chars]) do
		wakanda_name <> get_key_val(current_char) |> match_char(remaining_chars)
	end
	defp match_char([current_char | remaining_chars]) do
		"" <> get_key_val(current_char) |> match_char(remaining_chars)
	end

	defp get_key_val(key), do: WakandaNameKey.key()[key]

	defp split_string(str, delim \\ "") do
		str
		|> String.split(delim, trim: true)
		|> Enum.map(&String.upcase(&1))
	end

	defp to_name(list) do
		list
		|> Enum.uniq()
		|> Enum.join(" ")
	end
end
