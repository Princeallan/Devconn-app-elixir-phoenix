defmodule Myapp.RateLimiter do
  use GenServer

  #Client API
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def check_limit(api_key) do
    GenServer.call(__MODULE__, {:check_limit, api_key})
  end

  #Server Callbacks
  @impl true
  def init (state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:check_limit, api_key}, _from, state) do
    case Map.get(state, api_key) do
      nil ->
        {:reply, {:error, :invalid_key}, state}
        %{remaining: remaining} = data when remaining > 0 ->
        new_data = %{data | remainig: remaining - 1}
        {:reply, {:ok, new_data}, Map.put(state, api_key, new_data)}
        %{remaining: 0} ->
        {:reply, {:error, :limit_exceeded}, state}
    end
  end
end
