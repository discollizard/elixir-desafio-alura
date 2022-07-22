defmodule ElixirTesteTest.RandTest do
  use ExUnit.Case
  import Mock

  test "2 escritas no arquivo geram números diferentes" do
    ElixirTeste.Rand.escrever()

    conteudo = File.read!(Path.join([
      :code.priv_dir(:elixir_teste),
      "arquivo.txt"
    ]))

    ElixirTeste.Rand.escrever()

    conteudo2 = File.read!(Path.join([
      :code.priv_dir(:elixir_teste),
      "arquivo.txt"
    ]))

    assert conteudo != conteudo2

  end

  test "com mock" do
    :ets.new(:conteudos, [
      :set,
      :private,
      :named_table
    ])

    with_mock File, [write!: fn (_path, content) -> :ets.insert_new(:conteudos, {content}) end] do
      ElixirTeste.Rand.escrever()
      ElixirTeste.Rand.escrever()
    end

    conteudos = :ets.tab2list(:conteudos)
    [primeiro_valor | conteudos] = conteudos
    [segundo_valor | _] = conteudos

    assert primeiro_valor != segundo_valor
  end
end
