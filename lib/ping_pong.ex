defmodule PingPong do
  @moduledoc """
  PingPong is an innovative module in the Elixir ecosystem to efficiently
  play ping pong, but with message passing. With this module you can learn
  more about Processes, which are the unit of concurrency of Erlang.
  Processes share no memory with each other and can only communicate with 
  each other via message passing.
  """

  @doc """
  Starts a process which responds to ping messages.
  """
  def start do
    await([])
  end

  defp await(events) do
    receive do
      {:ping, pid} ->
        events = increment(:ping, events)
        send pid, :pong
      {:ping_count, pid} ->
        send pid, {:ping_count, ping_count(events)}
    end
    await(events)
  end

  defp increment(type, events) do
    events ++ [type]
  end

  defp ping_count(events) do
    Enum.reduce(events, 0, fn(event, acc) ->
      case event do
        :ping -> acc + 1
        _     -> acc
      end
    end)
  end
end
