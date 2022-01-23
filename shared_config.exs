defmodule PersonalInfo.Umbrella.SharedConfig do
  def config,
    do: [
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/jmhossler/jmhossler.net",
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.html": :test,
        "coveralls.json": :test,
        "coveralls.lcov": :test
      ],
      test_coverage: [tool: ExCoveralls, output: "cover"],
      elixirc_options: [
        warnings_as_errors: true
      ],
      dialyzer: [
        plt_file: {:no_warn, "../../priv/dialyzer.plt"},
        flags: [:unknown, :unmatched_returns, :error_handling, :race_conditions]
      ]
    ]
end
