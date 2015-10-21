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
        events = add_event(:ping, events)
        send pid, :pong
      {:pong, pid} ->
        events = add_event(:pong, events)
        send pid, :ping
      {:ping_count, pid} ->
        send pid, {:ping_count, ping_count(events)}
      {:pong_count, pid} ->
        send pid, {:pong_count, pong_count(events)}
    end
    await(events)
  end

  defp add_event(type, events) do
    [type | events]
  end

  defp count_by_type(type, events) do
    Enum.reduce(events, 0, fn(event, acc) ->
      case event do
        ^type -> acc + 1
        _    -> acc
      end
    end)
  end

  defp ping_count(events) do
    count_by_type(:ping, events)
  end

  defp pong_count(events) do
    count_by_type(:pong, events)
  end
end
