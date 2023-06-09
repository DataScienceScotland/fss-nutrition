source("scripts/global.R")
ui <- tagList(  tags$head(
  tags$link(rel = "stylesheet", type = "text/css", href = "dashboard_style.css")),
  dashboardPage(
    title = "FSS Nutrition Dashboard",
    
    
    # HEADER ------------------------------------------------------------------
    dashboardHeader(
      title = div(tags$a(href='https://www.foodstandards.gov.scot/',
                         tags$img(src='fss_logo.png', width = 80)), "FSS Nutrition Dashboard"),
      titleWidth = 410
    ),
    
    
    # SIDEBAR  ---------------------------------------------------------------
    
    dashboardSidebar(
      sidebarMenu(menuItem("  Trends over time", tabName = "overtime", icon = icon("chart-line")),
                  menuItem("  Yearly profile", tabName = "yearly", icon = icon("bars-progress")),
                  menuItem("  F&D categories", tabName = "categories", icon = icon("carrot")),
                  menuItem("  Chart builder", tabName = "chart-builder", icon = icon("chart-simple")))
      
    ),
    
    
    # BODY --------------------------------------------------------------------
    
    dashboardBody(
      # tags$head(
      #     tags$link(
      #         rel = "stylesheet", 
      #         type = "text/css", 
      #         href = "radar_style.css")
      # ),
      customTheme,
      tabItems(
        
        tabItem(tabName = "overtime",
                overtimeTabUI("overtime")
                
        ), 
        
        tabItem(tabName = "yearly",
                yearlyTabUI("yearly")
                
        ), 
        
        tabItem(tabName = "categories",
                " "
                
        ), 
        
        tabItem(tabName = "chart-builder",
                
                " "
        )
        
        
        
        
      )         
    )
  )
)







server <- function(input, output, session) {
  
  overtimeTabServer("overtime", overall, promotype, online, totals_pppd)
  
  
  yearlyTabServer("yearly", overall, promotype, online, totals_pppd)
}



# Run the application 
shinyApp(ui = ui, server = server)
