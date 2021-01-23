# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Nurtur.Repo.insert!(%Nurtur.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, _admin} =
  Nurtur.Accounts.register_user(%{
    email: "dave@company.com",
    password: "davedavedave",
    password_confirmation: "davedavedave",
    role: :system
  })
