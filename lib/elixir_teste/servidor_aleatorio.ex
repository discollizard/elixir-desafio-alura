defmodule ElixirTeste.ServidorAleatorio do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: :servidor_aleatorio)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast(:escreve, _) do
    ElixirTeste.UptimeLog.log_pings()
    {:noreply, %{}}
  end
end
