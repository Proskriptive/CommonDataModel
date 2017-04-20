#Initiate Graph

library(RNeo4j)
library(yaml)
startNeo4JDb <-
  function(host = "localhost",
           user_name = "neo4j",
           password = "neo4j",
           config_file) {
    if (!missing(config_file)) {
       config <- yaml.load_file(config_file)
      host = config$db_information$host
      user_name = config$db_information$user_name
      password = config$db_information$password
    }
    server <- paste("http://", host, ":7474/db/data", sep = "")
    graph <-
      startGraph(server, username = user_name , password = password)
    graph
    
  }
#graph <- startNeo4JDb(host = "192.168.0.3")
#graph <- startNeo4JDb(host = "192.168.0.14")
#graph <- startNeo4JDb(host = "192.168.0.105")
#graph <- startNeo4JDb(host = "10.42.0.1")

graph <-
  startNeo4JDb(config_file = "./config/config.yaml")
graph
