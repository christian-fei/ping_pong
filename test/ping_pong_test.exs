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

  test "keeps tracks of pings and pongs" do
    pid = spawn_link PingPong, :start, []
    send pid, {:ping, self}
    send pid, {:ping, self}
    send pid, {:ping_count, self}
    assert_receive {:ping_count, 2}
  end
end
