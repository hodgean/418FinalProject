library(markdown)
library(shiny)
library(shinyjs)
library(shinythemes)
library(shinydashboard)
library(rsconnect)
ui <- (fluidPage(headerPanel(h6("Andrew Hodge",style="color:black")),
                 titlePanel(h5('STA 418 Project: Earthquake Shiny App',style="font-weight: 300; color:black")),
                 navbarPage(title =h3("HOME",style = "font-weight: 450; line-height: 1.0; color: black"),
                            
                            tabPanel(h3("DATA",style = "font-weight: 450; line-height: 1.0; color: black"),
                                     mainPanel(
                                       h3('Data from USGS',style = "
                                           font-weight: 450; line-height: 1.0; 
                                           color: seagreen;" ),
                                       verbatimTextOutput("ii"),
                                       DT::dataTableOutput("tables")
                                     )
                            ),
                            
                            tabPanel(h3('EARTHQUAKE',style = "font-weight: 450; line-height: 1.0; color: black"),
                                     sidebarLayout(
                                       sidebarPanel(
                                         h3('Last 30 Day Analysis (updated every 15 min.)',style = "font-weight: 450; line-height: 1.0; 
                                             color:seagreen ;"),  
                                         h3('Summary'),
                                         verbatimTextOutput("summary2")
                                       ),
                                       
                                       mainPanel(
                                         h3('Significant earthquakes: last 30 days',style = "
                                             font-weight: 450; line-height: 1.0; 
                                             color:seagreen ;"),
                                         DT::dataTableOutput("table")
                                       )
                                     )
                            ),
                            
                            
                            
                            navbarMenu(h3('ARIMA',style = "font-weight: 450; line-height: 1.0; color: black"),
                                       tabPanel(h4('ACF/PACF',style="color:darkmagenta"),
                                                sidebarLayout(
                                                  sidebarPanel(
                                                    h3('ACF is used to identify the possible structure of time series data.', style = "
                                                        font-weight: 450; line-height: 1.0; 
                                                        color: seagreen;"),
                                                    h3('PACF gives the partial correlation of the time series.', style = "
                                                        font-weight: 450; line-height: 1.0; 
                                                        color: seagreen;")
                                                    
                                                  ),
                                                  mainPanel(
                                                    fluidRow(
                                                      splitLayout(cellWidths = c("50%", "50%"), plotOutput("plot2"), plotOutput("plot3"))
                                                    )
                                                  )
                                                )
                                       ),
                                       tabPanel(h4("Forecasting",style="color:darkmagenta"),
                                                titlePanel(h3("Earthquake Prediction: every 15 minutes", style = "
                                                               font-weight: 450; line-height: 1.0; 
                                                               color: seagreen;")),
                                                
                                                mainPanel(
                                                  h3(numericInput('b2',h3('Number of periods',style="color:seagreen"),2,min=1)),
                                                  verbatimTextOutput("b2")
                                                )
                                       )
                            ),
                            
                            
                            navbarMenu(h3('SPECTRAL',style = "font-weight: 450; line-height: 1.0; color: black"),
                                       
                                       tabPanel(h4("Periodogram",style="color:darkmagenta"),
                                                sidebarLayout(
                                                  sidebarPanel(
                                                    h3('A periodogram is used to identify the dominant periods of a time series.', style = "
                                                        font-weight: 450; line-height: 1.0; 
                                                        color: seagreen;")
                                                    
                                                  ),
                                                  mainPanel(
                                                    plotOutput("plot",width  = "500px",height = "400px")
                                                  )
                                                )
                                       ),
                                       tabPanel(h4("Forecasting",style="color:darkmagenta"),
                                                
                                                mainPanel(
                                                  
                                                  h3(numericInput('T', h3('Enter Periodogram value (highest peak)',style="color:seagreen"),0.5,min=1)),
                                                  verbatimTextOutput("T5"))
                                                
                                       )
                                       
                                       
                                       
                            )
                            
                            
                            
                            
                            
                 )                                  )
)
shinyApp(ui, server)