defmodule NurturWeb.UserSessionController do
  use NurturWeb, :controller

  alias Nurtur.Accounts
  alias NurturWeb.UserAuth

  def new(conn, _params) do
    render(conn, "new.html", error_message: nil)
  end

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    user = Accounts.get_user_by_email_and_password(email, password)

    if user && user.confirmed_at do
      UserAuth.log_in_user(conn, user, user_params)
    else
      render(conn, "new.html", error_message: determine_error_message(user))
    end
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Logged out successfully.")
    |> UserAuth.log_out_user()
  end

  defp determine_error_message(user) do
    if user do
      "Please complete registration"
    else
      "Invalid email or password"
    end
  end
end
