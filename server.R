library(RCurl)
library(XML)
library(lsa)

shinyServer(
  function(input, output) {
   output$Value<-renderPrint({input$k})
   output$words<-renderTable({
     input$goButton
     if (input$goButton>0){  
         isolate({
         html.file <- getURL(input$url, ssl.verifyhost = FALSE, ssl.verifypeer = FALSE, followlocation = TRUE)
         html = htmlTreeParse(html.file, useInternal=TRUE)
         text<- toString(xpathApply(html, "//body//text()
                                    [not(ancestor::script)][not(ancestor::style)]", xmlValue))
                  
         text<-gsub("<.*?>", "", text)
         text<-gsub("\t",'',text)
         text<-gsub("\n","",text)
         text<-gsub("[.*?]",'',text)
         text<-gsub("[[:punct:]]", "\\1", text)
         text<-gsub("\\d+", "\\1", text)
         text<-gsub("[[:cntrl:]]", "\\1", text)
         text<-tolower(text)  
         
         text<-strsplit(text," ")
         text<-text[[1]]
         text<-text[ text!= ""]
         text<-text[!nchar(text)<=2]
         text<-text[!nchar(text)>15]
         stopwords_en<-c(stopwords_en,""," ","oct")
         text<-text[!text%in%stopwords_en]
         text<-as.factor(text)
         text<-head(summary(text),input$k)
         text<-as.data.frame(text)
         colnames(text)<-c("count")
         return(text)
    })}})
  })