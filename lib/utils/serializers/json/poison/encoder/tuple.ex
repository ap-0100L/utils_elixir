# defimpl Poison.Encoder, for: Tuple do
#  ##############################################################################
#  ##############################################################################
#  @moduledoc """
#
#  Poison.Encoder, for: Tuple
#
#  """
#
#  ##############################################################################
#  @doc """
#
#  """
#  def encode(tuple, options) do
#    tuple
#    |> Tuple.to_list()
#    |> Poison.Encoder.List.encode(options)
#  end
# end
