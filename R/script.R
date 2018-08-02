## This is a script that will download all the packages and library them.

install.packages('devtools')
library('devtools')

devtools::install_github('tuotuoZ/docker_test')
library('docker_test')