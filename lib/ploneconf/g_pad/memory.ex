defmodule Ploneconf.GPad.Memory do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def get_value(name) do
    GenServer.call(__MODULE__, {:get_value, name})
  end

  def set_value(name, value) do
    GenServer.call(__MODULE__, {:set_value, name, value})
  end

  def handle_call({:get_value, name}, _, state) do
    {:reply, Map.get(state, name), state}
  end

  def handle_call({:set_value, name, value}, _, state) do
    {:reply, :ok, Map.put(state, name, value)}
  end
end
