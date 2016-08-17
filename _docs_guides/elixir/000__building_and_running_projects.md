Run a single file
=================

    elixir [name-of-file] 

REPL
====
*   CLI command:

    iex

Compile and run
===============
*   run project through repl from CLI:

    iex -S mix


Rerunning project on change
===========================
mix.exs component
-----------------
*   in def application list:

        applications: applications(Mix.env)

*   just past def application list:

        defp applications(:dev), do: applications(:all) ++ [:remix]
        defp applications(_all), do: [:logger]

*   at end of file:

        defmodule NewMix do
          use Application

          def start(_type, _args) do
            IO.puts "starting"
            IO.puts "step 2!"
            Task.start(fn -> :timer.sleep(1000); IO.puts("done sleeping") end)
          end
        end

CLI command
-----------

    relixer [directory-or-file-to-watch] [elixir-file-to-run-on-change]
