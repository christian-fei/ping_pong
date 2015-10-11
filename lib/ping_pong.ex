defmodule PingPong do
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
