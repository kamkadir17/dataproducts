#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data(EuStockMarkets)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    legends <- c("DAX","SMI","CAC","FTSE")
    
    reactive({
        DAX = 0
        SMI = 0
        CAC = 0
        FTSE = 0
    })
    
    DAX <- reactive({
        if(input$show_DAX)
        {
            1
        }
    })
    
    SMI <- reactive({
        if(input$show_SMI)
        {
            1
        }
    })
    
    CAC <- reactive({
        if(input$show_CAC)
        {
            1
        }
    })
    
    FTSE <- reactive({
        if(input$show_FTSE)
        {
            1
        }                
    })    
    
    output$distPlot <- renderPlot({
        
        legends <- c()
        
        if(!is.null(DAX())) {
            
            plot(ecdf(EuStockMarkets[,"DAX"]),
                 xlim=c(1500,8500),
                 xlab="Closing price (Euro)",
                 ylab="Cumulative Proportion",
                 main="Stock price distributions on EU exchanges from 1991-1998",
                 col="black")

                 legends <- c("DAX")
                 colors <- c("black")

        }
        
        if(!is.null(SMI()))
        {
            if(!is.null(DAX()))
            {
                lines(ecdf(EuStockMarkets[,"SMI"]),
                      col="blue")          
                legends <- c(legends, "SMI")
                colors <- c(colors,"blue")  
            }
            else
            {
                plot(ecdf(EuStockMarkets[,"SMI"]),
                     xlim=c(1500,8500),
                     xlab="Closing price (Euro)",
                     ylab="Cumulative Proportion",
                     main="Stock price distributions on EU exchanges from 1991-1998",
                     col="blue")

                legends <- c("SMI")
                colors <- c("blue")                
            }
        }
        
        if(!is.null(CAC()))
        {
            if(!is.null(DAX()) ||!is.null(SMI())  )
            {
                lines(ecdf(EuStockMarkets[,"CAC"]),
                      col="red")  
                legends <- c(legends, "CAC")
                colors <- c(colors,"red")                

            }
            else
            {
                plot(ecdf(EuStockMarkets[,"CAC"]),
                     xlim=c(1500,8500),
                     xlab="Closing price (Euro)",
                     ylab="Cumulative Proportion",
                     main="Stock price distributions on EU exchanges from 1991-1998",
                     col="red")
                legends <- c("CAC")
                colors <- c("red")
            }
        }
        
        if(!is.null(FTSE()))
        {
            if(!is.null(DAX()) || !is.null(SMI()) || !is.null(CAC()))
            {
                lines(ecdf(EuStockMarkets[,"FTSE"]),
                      col="purple")  
                legends <- c(legends, "FTSE")
                colors <- c(colors,"purple")                

            }
            else
            {
                plot(ecdf(EuStockMarkets[,"FTSE"]),
                     xlim=c(1500,8500),
                     xlab="Closing price (Euro)",
                     ylab="Cumulative Proportion",
                     main="Stock price distributions on EU exchanges from 1991-1998",
                     col="purple")
                legends <- c("FTSE")
                colors <- c("purple")
            }
        }
        
        legend('bottomright', 
               legend=legends,  # text in the legend
               col=colors,  # point colors
               pch=15)  # specify the point type to be a square         
        
    })

    #output$legends <- legends
})


