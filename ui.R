library(shiny)

shinyUI(pageWithSidebar(
  headerPanel(h2("Most frequent words at the website"),
),         
  sidebarPanel(
  h3("Insert the link"),
 textInput("url","URL:"),
 h4("Insert the number of top words"),
 numericInput('k', 'Number of words to display (from 10 to 100)', 0, min = 10, max = 100, step = 5),
 actionButton("goButton", "Submit")
  
  ),
  mainPanel(
   h3(paste("Top words")),
   p("Insert the website adress (html only) and the number of top words you wish to see into the left panel bars.
     Please note that calculation of top words may take some time."),
   "For more information about the program please read",
   a(href="helpfile.html", "documentation")
   ,
   
   p(tableOutput("words"))
    
  )
))







