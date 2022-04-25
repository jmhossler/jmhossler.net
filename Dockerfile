FROM bitwalker/alpine-elixir-phoenix:1.13.1 as base

ENV HOME=/app
WORKDIR /app

ENV MIX_ENV=prod

FROM base as build

RUN mix do local.hex --force, local.rebar --force

ADD mix.exs /app
ADD mix.lock /app
ADD shared_deps.exs /app 
ADD shared_config.exs /app 
ADD apps/personal_info/mix.exs /app/apps/personal_info/mix.exs
ADD apps/personal_info_web/mix.exs /app/apps/personal_info_web/mix.exs
RUN mix deps.get --only ${MIX_ENV} && mix deps.compile --only ${MIX_ENV}

COPY apps /app/apps
COPY config /app/config

RUN cd /app/apps/personal_info_web && \
    mix compile && \
    mix assets.deploy && \
    cd /app && mix release

FROM base as production

# Copy in our application and set it up to run as a non-privileged user
USER nobody:nogroup
COPY --from=build --chown=nobody:nogroup /app/_build/${MIX_ENV}/rel/server ./

CMD ["/app/bin/server", "start"]