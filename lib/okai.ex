defmodule Okai do
  import NimbleParsec
  import Okai.Helpers

  defparsec(
    :parse_sack,
    string("+SACK:GTHBD")
    |> ignore(string(","))
    |> concat(version())
    |> ignore(string(","))
    |> concat(count())
    |> concat(tail())
  )

  defparsec(
    :parse_ack,
    string("+ACK:GTHBD")
    |> ignore(string(","))
    |> concat(version())
    |> ignore(string(","))
    |> concat(imei())
    |> ignore(string(","))
    |> concat(device_name())
    |> ignore(string(","))
    |> concat(ble_command_password())
    |> ignore(string(","))
    |> concat(generated_time())
    |> ignore(string(","))
    |> concat(count_number())
    |> concat(tail())
  )
end
