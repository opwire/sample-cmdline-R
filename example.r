source("bootstrap.r")
source("command_args.r")

### main
args <- load_args()

tryCatch({
    # load environment varialbes & input data
    store <- bootstrap(args)
    # do something with input data
    # .....

    # output
    if (args$output_format == "json") {
        cat(toJSON(store))
    } else {
        for (key in names(store)) {
            cat(paste(toupper(key), ":\n"))
            data <- store[[key]]
            if (is.character(data)) {
                cat(data)
            } else {
                cat(toJSON(data))
            }
        }
    }
}, error = function(e) {
        errorList <- list(name= "error-name", message = e$message)
        # if (args$output_format == "json") {
        #     cat(toJSON(errorList))
        # } else {
        #     cat(sprintf('%s : %s', errorList$name, errorList$message))
        # }
    }
)