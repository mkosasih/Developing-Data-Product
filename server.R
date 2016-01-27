library(shiny)
require(stats)
require(TSP)
library(UsingR)
library(ggplot2)

data(eurodist)
dataM <- as.matrix(eurodist)
cities <- row.names(dataM)


groupByCity <- function(dt, cities) {
    dataD <- as.data.frame(dataM)
    colNums <- match(cities, names(dataD))
    rowNums <- which(rownames(dataD) %in% cities)
    selectedD <- dataD[rowNums,colNums]
    
    selectedM <- as.matrix(selectedD)
    dataA <- as.ATSP(selectedM)
    tsp <- insert_dummy(dataA, label = "cut")
    tour <- solve_TSP(tsp, method = "nn")
    path <- cut_tour(tour, "cut")
    labels(path)
}

totalTour <- function(dt, cities) {
    dataD <- as.data.frame(dataM)
    colNums <- match(cities, names(dataD))
    rowNums <- which(rownames(dataD) %in% cities)
    selectedD <- dataD[rowNums,colNums]
    
    selectedM <- as.matrix(selectedD)
    dataA <- as.ATSP(selectedM)
    tsp <- insert_dummy(dataA, label = "cut")
    tour <- solve_TSP(tsp, method = "nn")
    tour_length(tour)
}


shinyServer(
    function(input, output) {
        output$oid2 <- renderPrint({input$id2})
        output$oid3 <- renderPrint({groupByCity(dataM,input$id2)})
        output$oid4 <- renderPrint({totalTour(dataM,input$id2)})
        
        output$newHist <- renderPlot({
            
            
            dataD <- as.data.frame(dataM)
            cities <- input$id2
            colNums <- match(cities, names(dataD))
            rowNums <- which(rownames(dataD) %in% cities)
            selectedD <- dataD[rowNums,colNums]
            
            selectedM <- as.matrix(selectedD)
            loc <- cmdscale(selectedM, k=2)
            rx <- range(x <- loc[,1])
            ry <- range(y <- -loc[,2])
            
            plot(x, y, type="p", asp=1, xlab="", ylab="", col="blue", pch =19, lty="solid")
            text(x, y, cex=0.7, pos=3)

           
        })
        
    }
)