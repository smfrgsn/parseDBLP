require(XML)
branchFunction <- function() {
  store <- new.env() 
    
  func <- function(x, ...) {
    ns <- getNodeSet(x, path = "//author")
    authorArray = {};
    for(i in 1:100){
      value <- xmlValue(ns[[i]])
      print(value)
      authorArray[i] = value;
    }
    key = "author";
    store[[key]] <- authorArray; 
  }
  getStore <- function() { as.list(store) }
  list(dblp=func, getStore=getStore)
}

myfunctions <- branchFunction()

xmlEventParse(
  file = "~/Downloads/dblp3.xml", 
  handlers = NULL, 
  branches = myfunctions,
  replaceEntities=TRUE
)


s = xmlTreeParse("~/Downloads/dblp3.xml")

titles = list()
xmlTreeParse("~/Downloads/dblp2.xml", replaceEntities=TRUE, handlers = list(author = function(x)
  titles[[length(titles) + 1]] <<- x))
sapply(titles, xmlValue)


#to see what is inside
myfunctions$getStore()




dblpblah = function(x, ...) {
  #This is a "branch" function
  #x is a XML node - everything inside element 
  # find element <ArticleTitle> inside and print it:
  ns2 <- getNodeSet(x,path = "//title")
  authorArray = {};
  for (i in 1:length(ns2)){
  value <- xmlValue(ns2[[i]])
    print(value)
   authorArray[i] = value;
  }
  
}

xmlEventParse(
  file = "~/Downloads/dblp3.xml", 
  handlers = NULL, 
  branches = list(dblp = dblpblah)
)