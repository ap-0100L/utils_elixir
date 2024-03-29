defmodule ConfigUtils do
  use Utils

  ####################################################################################################################
  @doc """
  ## Function
  """
  def get_env(var, type, default \\ :no_default)

  def get_env(var, type, default) do
    result =
      with {:ok, val} <- System.fetch_env(var) do
        {:ok, result} =
          UniError.rescue_error!(
            (
              result =
                if val == "all" do
                  {:ok, val} = Utils.string_to_atom(val)

                  val
                else
                  if val == "" or val == nil do
                    case default do
                      :no_default ->
                        UniError.raise_error!(:CONFIG_UTILS_GET_ENV_ERROR, ["Variable [1] with name [#{var}] of type [#{type}] in system environment not found"], var: var, type: type, default: default)

                      _ ->
                        default
                    end
                  else
                    {:ok, result} = Utils.string_to_type!(val, type)

                    result
                  end
                end

              {:ok, result}
            ),
            {true, true, {:CONFIG_UTILS_GET_ENV_ERROR, ["Error while convert system environment variable with name [#{var}] of type [#{type}]"], var: var, type: type, default: default}}
          )

        result
      else
        :error ->
          case default do
            :no_default ->
              UniError.raise_error!(:CONFIG_UTILS_GET_ENV_ERROR, ["Variable [2] with name [#{var}] of type [#{type}] in system environment not found"], var: var, type: type, default: default)

            _ ->
              default
          end
      end

    result
  end
end
