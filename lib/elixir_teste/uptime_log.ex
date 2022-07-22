defmodule ElixirTeste.UptimeLog do
  @moduledoc """
  Módulo de funções que executam reqs HTTP e salvam os status no arquivo
  """
  import HTTPoison

  @doc """
  Essa função faz uma req http e salva em um arquivo log periodicamente o status da página
  """
  def log_pings do
    HTTPoison.start
    {:ok, file} =  File.open Path.join([:code.priv_dir(:elixir_teste), "arquivo.txt"]), [:append]
    IO.puts(Path.join([:code.priv_dir(:elixir_teste), "arquivo.txt"]))
    case HTTPoison.get "https://hex.pm/packages/httpoison" do
      {:ok, %HTTPoison.Response{status_code: code}} ->
        IO.binwrite(file, "Status from httpoison hex page at #{Time.utc_now()}: #{code} \n")
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.binwrite(file, "Oops! the site wasn't available at #{Time.utc_now()}, reason #{reason} \n")
    end

    File.close file
  end
end
