#Chargement des library
library(readxl)
library(shiny)
library(shinydashboard)
library(tidyverse)
library(ggplot2)
library(dplyr) 
library(timetk)
#Importation de la base de données
labase = read_xlsx("BaseCovidSN.xlsx")
#le serveur
shinyServer(function(input,output){

  output$evolution <- renderPlot({
    ggplot(labase)+geom_line(aes(Date, `taux de postivité`))
  })
  
#Pour afficher la base de donnés 
  output$base <- renderTable({
    data.frame(labase)}
   )
#Pour afficher les courbes  
  output$evolution <- renderPlot({
    ggplot(labase)+geom_line(aes(Date, `Cas positifs`))
  })
  output$cas_positif <- renderPlot({
    ggplot(labase, aes(Date, `Cas positifs`)) + geom_line()
  })
  output$cas_gueri <- renderPlot({
    ggplot(labase, aes(Date, `Cas testes`)) + geom_line()
  })
  output$cas_deces <- renderPlot({
    ggplot(labase, aes(Date, `Deces`)) + geom_line()
  })
  
  output$cas_com <- renderPlot({
    ggplot(labase, aes(Date, `Cas communautaires`)) + geom_line()
  })
})
