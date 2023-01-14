defmodule AssertValue.Mixfile do
  use Mix.Project

  def project do
    [
      app: :assert_value,
      version: "0.10.0",
      elixir: "~> 1.13",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      # Elixir 1.11 checks that all functions used by application belong
      # to modules listed in deps, applications, or extra_applications,
      # and emits warnings on compilation if they not.
      # Since IEx is a part of Elixir and always present we can skip
      # this check and suppress warning about IEx.Info.info/1
      xref: [exclude: [{IEx.Info, :info, 1}]]
    ]
  end

  def application do
    [
      applications: [],
      mod: {AssertValue.App, []}
    ]
  end

  defp deps do
    [
      {:temp, "~> 0.4", only: :test, runtime: false},
      {:credo, "~> 1.6", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp description do
    "ExUnit's assert on steroids that writes and updates tests for you"
  end

  defp package do
    [
      files: [
        "lib",
        ".formatter.exs",
        "mix.exs",
        "README.md",
        "CHANGELOG.md",
        "LICENSE"
      ],
      maintainers: ["Gleb Arshinov", "Serge Smetana"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/assert-value/assert_value_elixir",
        "Changelog" =>
          "https://github.com/assert-value/assert_value_elixir/blob/master/CHANGELOG.md"
      }
    ]
  end
end
