shinyUI(pageWithSidebar(
  headerPanel("Most frequent words at the website"),
  sidebarPanel(
  h3("Insert the link"),
 textInput("url","URL:"),
 h4("Insert the number of top words"),
 numericInput('k', 'Number of words to display (from 10 to 100)', 0, min = 10, max = 100, step = 5),
 actionButton("goButton", "Submit")
 
  ),
  mainPanel(
    h3(paste("Top words")),
    tableOutput("words")
  )
))



