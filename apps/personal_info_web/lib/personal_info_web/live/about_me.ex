defmodule PersonalInfoWeb.Live.AboutMe do
  use PersonalInfoWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="max-w-sm justify-center">
      <!-- This example requires Tailwind CSS v2.0+ -->
      <div class="bg-white shadow overflow-hidden sm:rounded-lg">
        <div class="px-4 py-5 sm:px-6">
          <h3 class="text-lg leading-6 font-medium text-gray-900">
            About Me
          </h3>
          <p class="mt-1 max-w-2xl text-sm text-gray-500">
            Personal details.
          </p>
        </div>
        <div class="border-t border-gray-200">
          <dl>
            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">
                Full name
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                <%= @name %>
              </dd>
            </div>
            <div class="bg-white-50 px-4 py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">
                Email address
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                <%= @email %>
              </dd>
            </div>
          </dl>
        </div>
        <div class="border-t border-gray-200">
          <dl>
            <div class="bg-gray-50 px-4 py-5 sm:grid sm:grid-cols-5 sm:gap-4 sm:px-6">
              <dt class="text-sm font-medium text-gray-500">
                Current Location
              </dt>
              <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-1">
                <%= @current_location %>
              </dd>
              <div class="px-4 py-5 sm:grid sm:grid-cols-3 text-sm text-gray-900 sm:mt-0">
                <div></div>
                <div class="aspect-w-3 aspect-h-2 rounded-lg overflow-hidden">
                  <img src={@current_location_image} class="w-full h-full object-center object-cover" />
                </div>
                <div></div>
              </div>
            </div>
          </dl>
        </div>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(name: "John Hossler")
     |> assign(email: "john.m.hossler@gmail.com")
     |> assign(current_location: "Seattle, WA")
     |> assign(current_location_image: ~s|#{PersonalInfoWeb.Endpoint.path("/images/seattle-rainier1-940x485.jpg")}|)}
  end

end
