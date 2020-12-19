library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(readxl)


    ui = dashboardPage(
         dashboardHeader(title = "Evolution du Covid19 Au Sénégal",
                         titleWidth = 300),
         dashboardSidebar(
             sidebarMenu(
                 menuItem("Vue globale", tabName = "vue", icon = icon("dashboard")),
                 menuItem("TOPs", tabName = "top", icon = icon("list-ol"))
                 
                 
                 )
         ),
         dashboardBody( 
            
        
         title = "Covid19-Senegal",
         skin = "blue"
    )

)