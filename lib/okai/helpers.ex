defmodule Okai.Helpers do
  import NimbleParsec

  def version() do
    ascii_string([?A..?Z, ?0..?9], 2)
    |> concat(hex_integer(4))
    |> label("version")
    |> tag(:version)
  end

  def hex_integer(digits) do
    ascii_string([?A..?F, ?0..?9], digits)
    |> reduce(:hex_to_integer)
  end

  def count() do
    hex_integer(4)
    |> label("count")
    |> unwrap_and_tag(:count)
  end

  def tail() do
    string("$")
    |> label("tail")
    |> unwrap_and_tag(:tail)
  end

  def imei() do
    ascii_string([?0..?9], 15)
    |> label("imei")
    |> unwrap_and_tag(:imei)
  end

  def device_name() do
    ascii_string([?0..?9, ?a..?z, ?A..?Z, ?-, ?_], max: 20)
    |> label("device_name")
    |> unwrap_and_tag(:device_name)
  end

  def ble_command_password() do
    ascii_string([0..127], max: 20)
    |> label("ble_command_password")
    |> unwrap_and_tag(:ble_command_password)
  end

  def generated_time() do
    ascii_string([?0..?9], 14)
    |> label("generated_time")
    |> unwrap_and_tag(:generated_time)
  end

  def count_number() do
    ascii_string([?A..?F, ?0..?9], 4)
    |> label("count_number")
    |> unwrap_and_tag(:count_number)
  end

  def hex_to_integer([string]) do
    String.to_integer(string, 16)
  end
end
