#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Shiny App - EuStockMarket Indices Comparison"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("Select Stock Indices to plot"),
            checkboxInput("show_DAX", "Show DAX Exchange", value=TRUE),
            checkboxInput("show_SMI", "Show SMI Exchange", value=TRUE),
            checkboxInput("show_CAC", "Show CAC Exchange", value=TRUE),
            checkboxInput("show_FTSE", "Show FTSE Exchange", value=TRUE),
            submitButton("Submit")
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Cumulative Proportion of Indices - EU Stocks"),
            plotOutput("distPlot"),
            br(),
            h5("Documentation"),
            h6("This shiny app will let you compare the indices to each other that you choose from the side panel. You can also view one index as a time. If no indices are choosen, it will not display any PLOT"),
            h6("Select indices that you want and click submit to see it in the PLOT")
        )
    )
))
