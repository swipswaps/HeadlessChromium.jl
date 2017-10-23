module HeadlessChromium

using HttpServer, WebSockets
import HTTP, URIParser, Mustache, JSON

import Base: send, close

export Target, send, close


### Initialize the const pointing to the Chromium executable

depsjl = joinpath(dirname(@__FILE__), "..", "deps", "deps.jl")

isfile(depsjl) ? include(depsjl) : error("HeadlessChromium not properly ",
    "installed. Please run\nPkg.build(\"HeadlessChromium\")")


### Includes + global var 'chromiumHandle' definition

global chromiumHandle = nothing

include("communication.jl")
include("misc.jl")


end # module
