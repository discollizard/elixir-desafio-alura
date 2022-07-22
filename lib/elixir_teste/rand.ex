defmodule ElixirTeste.Rand do
  def escrever do
    caminho_arquivo = Path.join([:code.priv_dir(:elixir_teste), 'arquivo.txt'])
    numero_aleatorio = :rand.uniform(1000)
    File.write(caminho_arquivo, "Número: #{numero_aleatorio}")
  end
end
