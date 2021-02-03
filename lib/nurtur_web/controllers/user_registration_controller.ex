defmodule NurturWeb.UserRegistrationController do
  use NurturWeb, :controller

  alias Nurtur.Accounts
  alias Nurtur.Accounts.User
  alias NurturWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_admin_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_admin(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :confirm, &1)
          )

        conn
        |> render("thank_you.html")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def thank_you(conn, _) do
    render(conn, "thank_you.html")
  end
end
