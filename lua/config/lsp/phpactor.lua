import("phpactor", function(actor)
    actor.setup({
        init_options = {
            ["language_server_phpstan.enabled"] = true,
            ["language_server.diagnostic_sleep_time"] = 100,
        }
    })
end)
