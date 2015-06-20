library(shiny)


# importing datasets
elec <- read.csv("data/household_electric_2013.csv", sep=",")
header <- c("Mth", "1-Room_and_2-Room", "3-Room", "4-Room", "5-Room_and_Executive", "Private_Apt_and_Condo", "Landed_Properties")
colnames(elec) <- header
elec$Mth <- as.factor(elec$Mth)

#defining Shiny UI
shinyUI(fluidPage(
                
        # Application title
        titlePanel("Household Electricity Consumption by Dwelling Type (2013)"),
        br(),
        br(),
        h3("Documentation"),
        p("This app allows visualisation of Singapore's household electricity consumption trends by dwelling type."),
        p("Simply click on the drop-down menu below to select the dwelling type."),
        p("And if you're feeling lucky..."),
        br(),
        br(),
        sidebarLayout(
                sidebarPanel(
                        selectInput("dwelling",
                                    "Types of Dwelling:",
                                    choices=colnames(elec)[2:7]),
                        
                        checkboxInput(inputId = "msg",
                                      label = strong("I'm feeling lucky!"),
                                      value = FALSE),
                        
                        conditionalPanel(condition = "input.msg == true",
                                         em(textOutput("text1"))
                                         ),
                        hr(),
                        helpText("Data from www.data.gov.sg.")
                ),
                
                mainPanel(                
                        plotOutput("elecPlot")
                )
        )
))