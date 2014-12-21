# server.R

source("certequiv.R")

shinyServer(function(input, output) {
        
        output$plot <- renderPlot({   
                               
                certequiv(ce=input$ce)
                
        })
})