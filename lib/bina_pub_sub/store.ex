defmodule BinaPubSub.Store do
  @pubsub_name :store
  @pubsub_topic "store_updates"

  def take(product, quantity) when is_binary(product) and is_integer(quantity) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:take, product, quantity})
  end

  def return(product, quantity) when is_binary(product) and is_integer(quantity) do
    Phoenix.PubSub.broadcast(@pubsub_name, @pubsub_topic, {:return, product, quantity})
  end

end
