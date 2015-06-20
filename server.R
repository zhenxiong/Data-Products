library(shiny)
library(gridExtra)

# importing datasets
elec <- read.csv("data/household_electric_2013.csv", sep=",")
header <- c("Mth", "1-Room_and_2-Room", "3-Room", "4-Room", "5-Room_and_Executive", "Private_Apt_and_Condo", "Landed_Properties")
colnames(elec) <- header
elec$Mth <- as.factor(elec$Mth)
color <- "aquamarine"

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        output$elecPlot <- renderPlot({
        
        if (input$msg) {
                color <- "lemonchiffon"
        }
        
        # Render a barplot
        barplot(elec[,input$dwelling], 
                col=color,
                border=NA,
                main=input$dwelling,
                ylab="Av. Monthly Household Electricity Consumption/ kWh",
                xlab="Month (Jan to Dec)"
                )
        })
                
        output$text1 <- renderText({ 
                "Thanks for checking out!"
        })
        
        
        })