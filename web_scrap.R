library(rvest)
library(dplyr)


scraper <- function(url, selector, output = "text", all_nodes = TRUE) {
  
  # Loading the web page content
  content <- read_html(url)
  
  # Getting one or all nodes
  if (all_nodes) {
    nodes <- content %>% 
      html_nodes(selector)
  } else {
    nodes <- content %>% 
      html_node(selector)
  }
  
  # Outputting text, table, attributes, or attribute
  
  if (output == "text") {
    answer <- nodes %>% html_text()
  } else if (output == "table") {
    answer <- nodes %>% html_table(fill = TRUE)
  } else if (output == "attrs") {
    answer <- nodes %>% html_attrs()
  } else {
    answer <- nodes %>% html_attr(output)
  }
  
  # Returning the output
  answer 
}
