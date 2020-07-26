defmodule PhilomenaWeb.RegistrationController do
  use PhilomenaWeb, :controller

  alias Philomena.Users
  alias Philomena.Users.User

  plug PhilomenaWeb.CaptchaPlug when action in [:create]

  def new(conn, _params) do
    changeset = Users.change_user_registration(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Users.deliver_user_confirmation_instructions(
            user,
            &Routes.confirmation_url(conn, :confirm, &1)
          )

        put_flash(conn, :info, "Account created successfully. Check your email for confirmation instructions.")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
