defmodule OkaiTest do
  use ExUnit.Case
  doctest Okai

  test "Heartbeat Report" do
    assert Okai.parse_ack(
             "+ACK:GTHBD,EF801C,862061041674804,ZK105,jFf;Xt3BXt(BjVzJQA%Q,20190816020036,0035$"
           ) ==
             {:ok,
              [
                "+ACK:GTHBD",
                {:version, ["EF", 32796]},
                {:imei, "862061041674804"},
                {:device_name, "ZK105"},
                {:ble_command_password, "jFf;Xt3BXt(BjVzJQA%Q"},
                {:generated_time, "20190816020036"},
                {:count_number, "0035"},
                {:tail, "$"}
              ], "", %{}, {1, 0}, 81}
  end

  test "Server Acknowledgement for Heartbeat" do
    assert Okai.parse_sack("+SACK:GTHBD,EF8001,02A1$") ==
             {:ok,
              [
                "+SACK:GTHBD",
                {:version, ["EF", 32769]},
                {:count, 673},
                {:tail, "$"}
              ], "", %{}, {1, 0}, 24}
  end
end
