library(shiny)
library(shinydashboard)
library(readxl)
library(readr)
library(ggplot2)
library(dplyr)
library(DT)
labase = read_excel("BaseCovidSN.xlsx")
#paste(labase$Date,collapse = "-")
#view(labase)
shinyUI(
  dashboardPage(
    
    dashboardHeader(title = "Corona virus",
                    #Mettre des message importants par rapport au covid-19
                    dropdownMenu(type = "message",
                                 messageItem(from ="Corona virus",message="Lavez vos mains avec de l'eau et du savon respecter les mesure",icon = icon("virus")) ,
                                 messageItem(from ="Corona virus",message="Respecter les mesure de bariere ",icon = icon("virus"))
                                )
                    ),
   
     dashboardSidebar(
     #bareMenu
      sidebarMenu( 
        menuItem("Base de donné",tabName = "données",icon = icon("database")),  
        menuItem("Cas positifs",tabName = "cas1",icon = icon("user-plus")),
        menuItem("Cas gueri",tabName = "cas2",icon = icon("virus-slash")),
        menuItem("Cas de  decès",tabName = "cas3" ,icon = icon("skull-crossbones")),
        menuItem("Cas communautaire",tabName = "cas4",icon = icon("virus")),
        menuItem("Cas importé",tabName = "cas5" ,icon = icon("file-import")),
        menuItem("Cas contact",tabName = "cas6" ,icon = icon("dizzy")),
        menuItem("Total des cas",tabName = "courbe",icon = icon("plus"))
      
                )),
  
    dashboardBody(
               tabItems(
       
                       tabItem(tabName = "cas1",
                               #pour les nombres totaux des cas
                               fluidRow(
                               valueBox(sum(labase$`Cas positifs`),"Nombre  cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                               valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                               valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                               ,
                               column(
                                 width = 12,
                                 box(
                                   title = "Evolution des cas positifs",
                                   footer = "Evolution des cas positifs",
                                   status = "info",
                                   width = 12,
                                   solidHeader = TRUE,
                                   
                                   plotOutput("cas_positif")
                                   
                                 )
                               )
                       )),
                       tabItem(tabName ="cas2", 
                              fluidRow(
                                valueBox(sum(labase$`Cas positifs`),"Nombre cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                                valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                                valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                             ) ,
                             column(
                               width = 12,
                               box(
                                 title = "Evolution des cas de guerisons",
                                 footer = "Evolution des cas de guerison",
                                 status = "info",
                                 width = 12,
                                 solidHeader = TRUE,
                                 
                                 plotOutput("cas_gueri")
                                 
                               )
                             )),
                      
                        tabItem( tabName = "cas3", 
                                fluidRow(
                                  valueBox(sum(labase$`Cas positifs`),"Nombre cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                                  valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                                  valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                                 ),
                                column(
                                  width = 12,
                                  box(
                                    title = "Evolution des cas de décès",
                                    footer = "Evolution des cas de décès",
                                    status = "info",
                                    width = 12,
                                    solidHeader = TRUE,
                                    
                                    plotOutput("cas_deces")
                                    
                                  )
                                )),
                      
                        tabItem( tabName = "cas4", 
                                fluidRow(
                                  valueBox(sum(labase$`Cas positifs`),"Nombre cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                                  valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                                  valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                                 ), column(
                                   width = 12,
                                   box(
                                     title = "Evolution des cas communautaires",
                                     footer = "Evolution des cas communautaires",
                                     status = "info",
                                     width = 12,
                                     solidHeader = TRUE,
                                     
                                     plotOutput("cas_com")
                                     
                                   )
                                 )), 
                       tabItem(tabName = "cas5",
                                             #pour les nombres totaux des cas
                                             fluidRow(
                                               valueBox(sum(labase$`Cas positifs`),"Nombre  cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                                               valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                                               valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                                               ,
                                               column(
                                                 width = 12,
                                                 box(
                                                   title = "Evolution des cas importes",
                                                   footer = "Evolution des cas importes",
                                                   status = "info",
                                                   width = 12,
                                                   solidHeader = TRUE,
                                                   
                                                   plotOutput("cas_import")
                                                   
                                                 )
                                               )
                                             )), 
                       tabItem(tabName = "cas6",
                                                         #pour les nombres totaux des cas
                                                         fluidRow(
                                                           valueBox(sum(labase$`Cas positifs`),"Nombre  cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                                                           valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                                                           valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                                                           ,
                                                           column(
                                                             width = 12,
                                                             box(
                                                               title = "Evolution des cas Contact",
                                                               footer = "Evolution des cas contact",
                                                               status = "info",
                                                               width = 12,
                                                               solidHeader = TRUE,
                                                               
                                                               plotOutput("cas_contact")
                                                               
                                                             )
                                                           )
                                                         )),
                       
                       
                       tabItem(tabName ="vue", box(title = "Evolution de la pandemie de Covid-19 au Sénégal",
                                                  plotOutput("evolution"), 
                                                  footer = "Données provenant du ministère de de la santé et de l'action social", 
                                                  status = "info",
                                                  solidHeader = TRUE,
                                                  width = 8)),
                      
                        tabItem(tabName ="courbe",
                               fluidRow(
                                 valueBox(sum(labase$`Cas positifs`),"Nombre cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                                 valueBox(sum(labase$Deces),"Nombre Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                                 valueBox(sum(labase$`Cas gueris`),"Nombre guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                           )
                         ),
                       tabItem(tabName = "données", fluidRow(
                         valueBox(sum(labase$`Cas positifs`),"Nombre total cas postifs", icon = icon("eye-open", lib = "glyphicon"),color="yellow"),
                         valueBox(sum(labase$Deces),"Nombre total Décès", icon = icon("user", lib = "glyphicon"), color = "red"),
                         valueBox(sum(labase$`Cas gueris`),"Nombre total guéris", icon = icon("thumbs-up", lib = "glyphicon"), color = "green")
                       ),box( title = "Base de données utilisée", tableOutput("base"), width = 34))
                    
                             )
)))
