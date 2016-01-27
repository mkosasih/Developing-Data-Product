
library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Finding the best route for your travel"),
    sidebarPanel(
        
        checkboxGroupInput("id2", "Select 3 or more Cities",
                           c("Athens" = "Athens",
                             "Barcelona" = "Barcelona",
                             "Brussels" = "Brussels",
                             "Calais" = "Calais",
                             "Cherbourg" = "Cherbourg",
                             "Cologne" = "Cologne",
                             "Copenhagen" = "Copenhagen",
                             "Geneva" = "Geneva",
                             "Gibraltar" = "Gibraltar",
                             "Hamburg" = "Hamburg",
                             "Hook of Holland" = "Hook of Holland",
                             "Lisbon" = "Lisbon",
                             "Lyons" = "Lyons",
                             "Madrid" = "Mardid",
                             "Marseilles" = "Marseilles",
                             "Milan" = "Milan",
                             "Munich" = "Munich",
                             "Paris" = "Paris",
                             "Rome" = "Rome",
                             "Stockholm" = "Stockholm",
                             "Vienna" = "Vienna"
                           )),
        submitButton('Submit')
        
    ),
    mainPanel(
        
        
        h4('Best route:'),
        verbatimTextOutput("oid3"),
        h4('Total Trip (in KM)'),
        verbatimTextOutput("oid4"),
        plotOutput('newHist')
    )
))