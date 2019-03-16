library("rjson")

bootstrap <- function(args) {
    store <- list()
    store <- load_env(store)
    store <- load_input(store)
    return(store)
}

load_env <- function(store) {
    for (envName in c("OPWIRE_EDITION", "OPWIRE_REQUEST", "OPWIRE_SETTING")) {
        envData = Sys.getenv(envName)
        if(is.character(envData)) {
            tryCatch({ 
                store[[envName]] <- fromJSON(envData)
            }, error = function(e) {
                store[[envName]] <- envData
                }
            )
        }
    }
    return(store)
}

load_input <- function(store) {
    input <- ""
    stdin <- file("stdin")
    open(stdin)
    while(length(line <- readLines(stdin, n = 1, warn = FALSE)) > 0) {
        input <- paste(input, line)
    }
    if (is.character(input) && nchar(input) > 0) {
        store$input <- fromJSON(input)
    }
    return(store)
}