
mydata = read.csv("C:\\Users\\BPO18\\Documents\\PrimarySalesData.csv")

depvar <- mydata$Tto

avail_wise <- setdiff(colnames(mydata), depvar)
avail_wise <- setNames(avail_wise,
                       paste0(avail_wise, "-wise"))
set.seed(20180307)
# random fill/color assignments
colors <- data.frame(
  field = avail_wise,
  fill = sample(palette(), length(avail_wise), replace=TRUE),
  color = sample(palette(), length(avail_wise), replace=TRUE)
)
str(colors)

ui <- fluidPage(
  theme = "bootstrap.css",
  titlePanel("Hello User"),
  fluidRow(
    column(3, wellPanel(
      selectInput("input_type", "Input type",
                  choices = avail_wise, selected = avail_wise[1] )
    ) ),
    column(9, wellPanel( uiOutput("ui") ))
  ),
  fluidRow(
    column(12, plotOutput("dynamic_value") )
  )
)

Server <- function(input, output) {
  
  output$ui <- renderUI({
    req(input$input_type)
    choices <- sort(unique(mydata[[input$input_type]]))  
    # 10 is arbitrary
    if (is.character(choices) || length(choices) < 10) {
      checkboxGroupInput("dynamic", paste0(input$input_type, "-wise"),
                         choices = choices, selected = choices[1],
                         inline = TRUE)
    } else {
      shiny::sliderInput("dynamic", paste0(input$input_type, "-wise"),
                         min = min(choices), max = max(choices),
                         value = round(quantile(choices, c(0.25,0.75)), 1))
    }
  })
  filtered <- reactive({
    req(input$dynamic)
    col <- filteredcolors()
    it <- isolate(input$input_type)
    if (is.character(input$dynamic)) {
      # checkboxGroupInput
      ind <- mydata[[it]] %in% input$dynamic
    } else {
      # sliderInput
      ind <- input$dynamic[1] <= mydata[[it]] & mydata[[it]] <= input$dynamic[2]
    }
    mydata[ind,,drop=FALSE]
  })
  filteredcolors <- reactive({
    dplyr::filter(colors, field == input$input_type)
  })
  output$dynamic_value <- renderPlot({
    req(filtered())
    col <- filteredcolors()
    ggplot(filtered(), aes_string(depvar)) +
      geom_histogram(fill=col$fill, col=col$color)
  })
}

shinyApp(ui = ui, server = Server)