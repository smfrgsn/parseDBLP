DBLPfile <- function(filename){
  
  # The DBLP filename is found by either 
  
  # Looking at the first argument or
  if (nargs>0){
    file = filename
  } else if (file.exists("../../data/parseDBLP/dblp.xml")){
  # Checking if it exists at ../../data/parseDBLP/
    file = "../../data/parseDBLP/dblp.xml"
  
  } else {
  # if it is not there
  # Downloading the file
  # Saving it to a sensible place  
  println("please download the dblp file from:")
  println("http://dblp.uni-trier.de/xml/ and save it ")
  println("in the appropriate data directory")
  file = "not set";
  }

}