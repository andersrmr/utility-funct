library(shiny)

shinyUI(fluidPage(
  titlePanel("Utility Function"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select your certainty equivalent. 
        This denotes the maximum amount you would
               accept for sure instead of having a 50-50
               chance at receiving either $0 or $10,000.
               Your certainty equivalent must be between
               $0 and $10,000.  The plot on the right
               displays a utility function for money over
               that range as implied by your certainty equivalent.
               A concave utility function denotes a risk averse
               attitude, convex denotes risk seeking, linear
               denotes risk neutral."),
      
      br(),
      br(),
    
      numericInput("ce", h5("Certainty Equivalent ="), 5000,0,10000,100)
      
    ),
    
    mainPanel(plotOutput("plot"))
  )
))