defmodule Mix.Tasks.Escreve do
  @moduledoc """
  Documentação: Escreve

  `mix escreve`
  """

  use Mix.Task
  @shortdoc "Escreveha"
  def run(_) do
    ElixirTeste.Rand.escrever()
  end
end
