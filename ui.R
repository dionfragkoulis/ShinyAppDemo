library(shiny)
library(ggplot2)

shinyUI(fluidPage(

    # Application title
    titlePanel("Interactive Data Model Creation"),

    sidebarLayout(
        sidebarPanel(
            selectInput("predictor", "Predictor Variable:",
                        c("Miles/(US) gallon (mpg)" = "mpg",
                          "Number of cylinders (cyl)" = "cyl",
                          "Displacement (cu.in.) (disp)" = "disp",
                          "Gross horsepower (hp)" = "hp",
                          "Rear axle ratio (drat)" = "drat",
                          "Weight (1000 lbs) (wt)" = "wt",
                          "	1/4 mile time (qsec)" = "qsec")),
            selectInput("outcome", "Outcome Variable:",
                        c("Displacement (cu.in.) (disp)" = "disp",
                          "Number of cylinders (cyl)" = "cyl",
                          "Miles/(US) gallon (mpg)" = "mpg",
                          "Gross horsepower (hp)" = "hp",
                          "Rear axle ratio (drat)" = "drat",
                          "Weight (1000 lbs) (wt)" = "wt",
                          "	1/4 mile time (qsec)" = "qsec")),
            selectInput("pointShape", "Plot Point Shapes:",
                        c("Circle" = 1,
                          "Star" = 8,
                          "Cross" = 4,
                          "Triangle" = 2)),
            checkboxInput("showModel", "Show/Hide Model", value = TRUE),
            selectInput("modelColor", "Model color:",
                        c("Red" = "red",
                          "Blue" = "blue",
                          "Green" = "green")),
            submitButton("Update", icon("refresh"))
        ),

        mainPanel(
            tabsetPanel(type = "tabs",
                tabPanel("App", plotOutput("scatterPlot", brush = brushOpts(id="plot_brush")), br(), h4("Selected Points"), br(), verbatimTextOutput("brush_info")),
                tabPanel("Help", icon = icon("question-sign", lib = "glyphicon"), 
                    h2("Application Help"),
                    HTML("
                        This application is a simple application aimed to demonstrate the <b>Shiny</b> functionality.
                        User can select 2 variables from <b>mtcars</b> dataset and create their scatter plot, as well a linear model.
                        User can also select (brush) points on the scatter plot and the related records will be displayed in a table below.
                        <br>
                        <u>It is important that the user always click the <b>Update</b> button, in order for the udpates to take effect.</u>
                         "),
                    h3("Input Fields"),
                    HTML("There are the following input fields:
                        <ul>
                            <li>Predictor Variable</li>
                            <li>Outcome Variable</li>
                            <li>Plot Point Shapes</li>
                            <li>Show/Hide Model</li>
                            <li>Model Color</li>
                        </ul>
                         "),
                    h4("Predictor Variable"),
                    HTML("Drop down menu, that displays a list of variables. The selected one will be the <b>x axis</b of the produced plor and the <b>predictor variable</b> for the linear model."),
                    h4("Outcome Variable"),
                    HTML("Drop down menu, that displays a list of variables. The selected one will be the <b>y axis</b of the produced plor and the <b>outcome variable</b> for the linear model."),
                    h4("Plot Point Shapes"),
                    HTML("Drop down menu, that displays a list of possible shapes for the scatter plot points."),
                    h4("Show/Hide Model"),
                    HTML("Check box that control whether the linear model will be displayed or not."),
                    h4("Model Color"),
                    HTML("Drop down menu, that displays a list of possible colors for the linear model.")
                )
            )
        )
    )
))
