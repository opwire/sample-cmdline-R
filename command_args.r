suppressPackageStartupMessages(library("argparse"))

load_args <- function() {
    parser <- ArgumentParser()
    parser$add_argument("-i", "--input-format", default="json", help="Format for input data")
    parser$add_argument("-o", "--output-format", default="json", help="Format for output data")
    parser$add_argument("-f", "--format", default="json", help="Default format for input/output data")
    
    args <- parser$parse_args()
    return(args)
}