defmodule Ploneconf.GPadTest do
  use Ploneconf.DataCase

  alias Ploneconf.GPad

  describe "settings" do
    alias Ploneconf.GPad.Setting

    @valid_attrs %{name: "some name", value: "some value"}
    @update_attrs %{name: "some updated name", value: "some updated value"}
    @invalid_attrs %{name: nil, value: nil}

    def setting_fixture(attrs \\ %{}) do
      {:ok, setting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GPad.create_setting()

      setting
    end

    test "list_settings/0 returns all settings" do
      setting = setting_fixture()
      assert GPad.list_settings() == [setting]
    end

    test "get_setting!/1 returns the setting with given id" do
      setting = setting_fixture()
      assert GPad.get_setting!(setting.id) == setting
    end

    test "create_setting/1 with valid data creates a setting" do
      assert {:ok, %Setting{} = setting} = GPad.create_setting(@valid_attrs)
      assert setting.name == "some name"
      assert setting.value == "some value"
    end

    test "create_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GPad.create_setting(@invalid_attrs)
    end

    test "update_setting/2 with valid data updates the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{} = setting} = GPad.update_setting(setting, @update_attrs)
      assert setting.name == "some updated name"
      assert setting.value == "some updated value"
    end

    test "update_setting/2 with invalid data returns error changeset" do
      setting = setting_fixture()
      assert {:error, %Ecto.Changeset{}} = GPad.update_setting(setting, @invalid_attrs)
      assert setting == GPad.get_setting!(setting.id)
    end

    test "delete_setting/1 deletes the setting" do
      setting = setting_fixture()
      assert {:ok, %Setting{}} = GPad.delete_setting(setting)
      assert_raise Ecto.NoResultsError, fn -> GPad.get_setting!(setting.id) end
    end

    test "change_setting/1 returns a setting changeset" do
      setting = setting_fixture()
      assert %Ecto.Changeset{} = GPad.change_setting(setting)
    end
  end
end
