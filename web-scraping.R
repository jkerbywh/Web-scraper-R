# Web Scraping ------------------------------------------------------------
rm(list = ls())
url = "https://www.imdb.com/chart/top"
link.class = ".ipc-title-link-wrapper" # link class name, found from its HTML source code
links = url %>% read_html_live() %>% html_elements(link.class) %>% .[1:250] %>% html_attr("href")
links

links <- sub("\\?.*", links, replacement = "")
links
links = paste(sep = "", links, "fullcredits/")
links
links = paste0("https://www.imdb.com", links)
links

producers = list()


class.title <- ".parent"
titles = c()
for (i in 1:250) {
  titles[i] <- links[i] %>% read_html_live() %>% html_elements(class.title) %>% html_text2()
  cat(sep = "", (i/250) * 100, "% loaded", "\n")
}
titles


table.names.class <- ".dataHeaderWithBorder"
names.of.tables <- links[250] %>% read_html_live() %>% html_elements(table.names.class) %>% html_text2()
names.tables

grep("Produced by", names.tables)

tables.class <- ".simpleTable.simpleCreditsTable"
tables <- links[250] %>% read_html_live() %>% html_elements(tables.class) %>% html_table()

tables[[grep("Produced by", names.tables) - 1]]$X1





table.names.class <- ".dataHeaderWithBorder"
tables.class <- ".simpleTable.simpleCreditsTable"

names.of.tables <- c()
tables <- c()
for (i in 1:250) {
  names.of.tables <- c(names.of.tables ,links[i] %>% read_html_live() %>% html_elements(table.names.class) %>% html_text2())
  tables <- links[i] %>% read_html_live() %>% html_elements(tables.class) %>% html_table()
  producers = c(producers, tables[[grep("Produced by", names.tables) - 1]]$X1)
  names.of.tables = c()
  tables = c()
  cat(sep = "", (i/250) * 100, "% loaded", "\n")
}
producers
producers[[1]]



occurances <- c()
count = 0
for (i in 1:length(producers)) {
  for (j in 1:length(producers)) {
    if (producers[[i]] == producers[[j]]) {
      count = count + 1
    }
  }
  occurances = c(occurances, count)
  count = 0
}
occurances
table(occurances)


producers[[199]]
which(occurances == 11)
which(occurances == 9)
which(occurances == 8)
which(occurances == 7)



producer1 = producers[[199]]
producer2 = producers[[32]]
producer3 = producers[[33]]
producer4 = producers[[13]]
producer5 = producers[[437]]

cat(sep = "", "The five producers who produced the most movies from among the top 250 are: \n", producer1,"\n", producer2, "\n", producer3, "\n",producer4, "\n",producer5)



