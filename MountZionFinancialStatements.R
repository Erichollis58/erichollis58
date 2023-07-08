library(shiny)
library(DT)

# Define the UI
ui <- fluidPage(
  titlePanel("Mount Zion Financial Statement Viewer"),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Income Statement", DTOutput("income_table")),
      tabPanel("Designated Funds", DTOutput("funds_table"))
    )
  )
)

# Define the server
server <- function(input, output) {
  
  # Load the income statement data
  income_data <- read.csv("C:/Users/Eric/OneDrive/Desktop/Mt Zion Finances/BudgetandFinance.csv", stringsAsFactors = FALSE)
  
  # Render the income statement table
  output$income_table <- renderDT({
    datatable(income_data, options = list(pageLength = 85))
  })
  
  # Load the designated funds data
  funds_data <- read.csv("C:/Users/Eric/OneDrive/Desktop/Mt Zion Finances/DesignatedFunds.csv", stringsAsFactors = FALSE)
  
  # Render the funds table
  output$funds_table <- renderDT({
    datatable(funds_data, options = list(pageLength = 50))
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
