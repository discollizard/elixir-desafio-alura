import Config

config :elixir_teste, ElixirTeste.Scheduler,
  jobs: [
    {"* * * * *", fn -> GenServer.cast(:servidor_aleatorio, :escreve) end}
  ]
