# PingPong

Play ping pong with a genserver.

First install the needed dependencies:

```
$> mix deps.get
```

Then you can run the tests as:

```
$> mix test
```

Try it in the console:

```
$> iex -S mix
iex(1)> pid = spawn_link PingPong, :start, []
#PID<0.117.0>
iex(2)> send pid, {:ping, self}
{:ping, #PID<0.115.0>}
iex(3)> flush
:pong
:ok
iex(4)> send pid, {:ping, self}
{:ping, #PID<0.115.0>}
iex(5)> flush
:pong
:ok
iex(6)> send pid, {:pong, self}
{:pong, #PID<0.115.0>}
iex(7)> flush
:ping
:ok
iex(8)> send pid, {:ping_count, self}
{:ping_count, #PID<0.115.0>}
iex(9)> flush
{:ping_count, 2}
:ok
iex(10)> send pid, {:pong_count, self}
{:pong_count, #PID<0.115.0>}
iex(11)> flush
{:pong_count, 1}
:ok
iex(12)>
```
