defmodule PersonalInfoWeb.Live.Home do
  use PersonalInfoWeb, :live_view

  alias PersonalInfoWeb.Live.Components

  def render(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
      <!-- This example requires Tailwind CSS v2.0+ -->
      <div class="bg-white shadow overflow-hidden sm:rounded-lg">
        <div class="px-4 py-5 sm:px-6">
          <h3 class="text-lg leading-6 font-medium text-gray-900">
            About Me
          </h3>
        </div>
        <div class="border-t border-gray-200">
          <Components.description_list>
            <:entry class="sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <Components.description_term>
                Name
              </Components.description_term>
              <Components.description_details>
                John
              </Components.description_details>
            </:entry>
            <:entry class="sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <Components.description_term>
                Twitch
              </Components.description_term>
              <Components.description_details>
                <a class="no-underline hover:underline text-blue-600 visited:text-purple-600" href="https://twitch.tv/hosslie">Hosslie!</a>
              </Components.description_details>
            </:entry>
            <:entry>
              <p class="text-sm font-small text-gray-500">
                Hi there! If you're finding this page now, it probably seems really empty. My goal here is to
                make an elixir server that can be used to host/service others for things I make! Right now,
                I am working on making a twitch plugin to control your lights, and I need a space to provide
                installation instructions as well as code to run to host the twitch listeners for you.
              </p>
            </:entry>
          </Components.description_list>
        </div>
      </div>
    </div>
    """
  end
end

defmodule PersonalInfoWeb.Live.Components do
  use PersonalInfoWeb, :component

  def description_list(assigns) do
    ~H"""
    <dl>
    <%= for entry <- @entry do %>
      <div class={"odd:bg-white even:bg-gray-50 px-4 py-5 #{Map.get(entry, :class, "")}"}>
        <%= render_slot(entry) %>
      </div>
    <% end %>
    </dl>
    """
  end

  def description_term(assigns) do
    ~H"""
    <dt class="text-sm font-medium text-gray-500">
      <%= render_slot(@inner_block) %>
    </dt>
    """
  end

  def description_details(assigns) do
    ~H"""
    <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
      <%= render_slot(@inner_block) %>
    </dd>
    """
  end
end
