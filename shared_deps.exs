defmodule PersonalInfo.Umbrella.SharedDeps do
  def deps,
    do: [
      {:git_hooks, "~> 0.5.0", only: [:test, :dev], runtime: false},
      {:excoveralls, "~> 0.14.4", only: :test},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:ex_parameterized, "~> 1.3", only: :test},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
end
