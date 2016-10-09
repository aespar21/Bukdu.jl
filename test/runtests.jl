workspace()
Base.Test.@testset "logger.jl" begin
    include("logger.jl")
end

workspace()
Base.Test.@testset "octo/assoc.jl" begin
    include("octo/assoc.jl")
end

workspace()
Base.Test.@testset "octo/changeset.jl" begin
    include("octo/changeset.jl")
end

workspace()
Base.Test.@testset "octo/natural.jl" begin
    include("octo/natural.jl")
end

workspace()
Base.Test.@testset "filter.jl" begin
    include("filter.jl")
end

workspace()
Base.Test.@testset "controller/conn.jl" begin
    include("controller/conn.jl")
end

workspace()
Base.Test.@testset "controller/pipeline.jl" begin
    include("controller/pipeline.jl")
end

workspace()
Base.Test.@testset "controller/params.jl" begin
    include("controller/params.jl")
end

workspace()
Base.Test.@testset "controller.jl" begin
    include("controller.jl")
end

workspace()
Base.Test.@testset "router/endpoint.jl" begin
    include("router/endpoint.jl")
end

workspace()
Base.Test.@testset "router/scope.jl" begin
    include("router/scope.jl")
end

workspace()
Base.Test.@testset "router/resource.jl" begin
    include("router/resource.jl")
end

workspace()
Base.Test.@testset "router.jl" begin
    include("router.jl")
end

workspace()
Base.Test.@testset "plug/session.jl" begin
    include("plug/session.jl")
end

workspace()
Base.Test.@testset "plug/static.jl" begin
    include("plug/static.jl")
end

workspace()
Base.Test.@testset "plug/logger.jl" begin
    include("plug/logger.jl")
end

workspace()
Base.Test.@testset "plug/oauth2.jl" begin
    include("plug/oauth2.jl")
end

workspace()
Base.Test.@testset "plug/upload.jl" begin
    include("plug/upload.jl")
end

workspace()
Base.Test.@testset "plug/csrf_protection.jl" begin
    include("plug/csrf_protection.jl")
end

workspace()
Base.Test.@testset "renderers/layout.jl" begin
    include("renderers/layout.jl")
end

workspace()
Base.Test.@testset "renderers/view.jl" begin
    include("renderers/view.jl")
end

workspace()
Base.Test.@testset "renderers/text.jl" begin
    include("renderers/text.jl")
end

workspace()
Base.Test.@testset "renderers/json.jl" begin
    include("renderers/json.jl")
end

workspace()
Base.Test.@testset "renderers/html/tag.jl" begin
    include("renderers/html/tag.jl")
end

workspace()
Base.Test.@testset "renderers/html/form.jl" begin
    include("renderers/html/form.jl")
end

workspace()
Base.Test.@testset "renderers/html.jl" begin
    include("renderers/html.jl")
end

workspace()
Base.Test.@testset "renderers/markdown.jl" begin
    include("renderers/markdown.jl")
end

workspace()
Base.Test.@testset "renderers/mustache.jl" begin
    include("renderers/mustache.jl")
end

workspace()
Base.Test.@testset "server/form_data.jl" begin
    include("server/form_data.jl")
end

workspace()
Base.Test.@testset "server.jl" begin
    include("server.jl")
end
