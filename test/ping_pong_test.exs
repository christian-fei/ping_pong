defmodule PingPongTest do
  use ExUnit.Case
  doctest PingPong

  test "responds to ping with pong" do
    pid = spawn_link PingPong, :start, []
    send pid, {:ping, self}
    assert_receive :pong
  end

  test "responds to multiple ping with pong" do
    pid = spawn_link PingPong, :start, []
    send pid, {:ping, self}
    assert_receive :pong
    send pid, {:ping, self}
    assert_receive :pong
  end
end
