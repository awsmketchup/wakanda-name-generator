defmodule WakandaNameGenerator.MixProject do
  use Mix.Project

  def project do
    [
      app: :wakanda_name_generator,
      version: "0.1.0",
	  description: "Wakanda Name Generator - transform your name into a Wakandan name",
	  source_url: "https://github.com/samuelralak/wakanda-name-generator",
	  homepage_url: "https://github.com/samuelralak/wakanda-name-generator",
      elixir: "~> 1.6",
	  maintainers: ["Samuel Ralak"],
      start_permanent: Mix.env() == :prod,
	  package: [
		  maintainers: ["Samuel Ralak"],
		  licenses: ["MIT"],
		  links: %{github: "https://github.com/samuelralak/wakanda-name-generator"},
		  files: ~w(lib) ++ ~w(mix.exs README.md)
	  ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
		mod: {WakandaNameGenerator, []},
		extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
		{:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
