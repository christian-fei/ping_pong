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

  defp await(state) do
    receive do
      {:ping, pid} -> send pid, :pong
    end
    await(state)
  end
end
