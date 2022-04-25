defmodule PersonalInfo.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.lcov": :test,
        "coveralls.xml": :test,
        "coveralls.json": :test
      ],
      releases: [
        server: [
          applications: [personal_info: :permanent, personal_info_web: :permanent],
          strip_beams: false,
          include_executables_for: [:unix]
        ]
      ],
      source_url: "https://github.com/jmhossler/jmhossler.net",
      test_coverage: [tool: ExCoveralls, output: "cover"],
      elixirc_options: [
        warnings_as_errors: true
      ],
      dialyzer: [
        plt_file: {:no_warn, "priv/dialyzer.plt"},
        flags: [:unknown, :unmatched_returns, :error_handling, :race_conditions, :no_opaque]
      ]
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp deps do
    []
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  #
  # Aliases listed here are available only for this project
  # and cannot be accessed from applications inside the apps/ folder.
  defp aliases do
    [
      # run `mix setup` in all child apps
      setup: ["cmd mix setup"]
    ]
  end
end
