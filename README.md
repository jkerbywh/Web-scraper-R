# 🎬 IMDb Top 250 Movie Web Scraper (R)

This project uses **R** and **web scraping** to extract information from IMDb’s [Top 250 Movies](https://www.imdb.com/chart/top) list.  
It was originally written to retrieve movie details such as titles and producer names from IMDb’s full credits pages.

---

## 📘 Overview

The script:
1. Loads IMDb’s Top 250 movie page  
2. Collects the links to each film’s **Full Credits** page  
3. Extracts the list of producers or basic movie information  
4. Displays progress and outputs the results to the console

The project demonstrates practical web scraping, looping, and HTML parsing using R.

---

## ⚠️ Important Notes

- **Outdated Packages**:  
  This project uses `chromote` and `read_html_live()` — these functions may not work properly in the current version of R or the latest CRAN packages.  
  You may need to replace them with updated alternatives such as:
  ```r
  library(rvest)
  page <- read_html("https://www.imdb.com")
