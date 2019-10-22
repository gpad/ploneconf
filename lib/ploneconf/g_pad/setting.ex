defmodule Ploneconf.GPad.Setting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "settings" do
    field :name, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(setting, attrs) do
    setting
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
