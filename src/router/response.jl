# module Bukdu

function conn_error_response(status::Symbol, verb::Symbol, path::String, ex, stackframes::Vector{StackFrame})
    code = statuses[status]
    conn_error_response(code, verb, path, ex, stackframes)
end
function conn_error_response(code::Int, verb::Symbol, path::String, ex, stackframes::Vector{StackFrame})
    with_color(sym, text) = "<strong>$text</strong>"

    Conn(code, Dict("Content-Type"=>"text/html"), string(
        "<h3>",
        uppercase(string(verb)),
        ' ',
        path,
        "</h3>",
        "<h3>$code $ex</h3>",
        "<pre>",
        Logger.inner_stackframes(stackframes, with_color),
        "</pre>"))
end

# used in server/handler.jl
function conn_no_content()
    Conn(:no_content, Dict{String,String}(), nothing) # 204
end

# used in server/handler.jl
function conn_not_found(verb::Symbol, path::String, ex, stackframes::Vector{StackFrame})
    conn_error_response(:not_found, verb, path, ex, stackframes) # 404
end

function conn_application_error{AE<:ApplicationError}(verb::Symbol, path::String, ex::AE, stackframes::Vector{StackFrame})
    conn_error_response(ex.conn.status, verb, path, ex, stackframes)
end

# used in router/routing.jl
function conn_bad_request(verb::Symbol, path::String, ex, stackframes::Vector{StackFrame})
    conn_error_response(:bad_request, verb, path, ex, stackframes) # 400
end
