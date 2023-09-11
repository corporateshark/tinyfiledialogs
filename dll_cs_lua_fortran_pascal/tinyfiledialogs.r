# Load the appropriate tinyfd library

dyn.load("tinyfiledialogsAppleSilicon.dylib")
#dyn.load("tinyfiledialogsIntel.dylib")
#dyn.load("tinyfiledialogsX32.so")
#dyn.load("tinyfiledialogsX64.so")
#dyn.load("tinyfiledialogs32.dll")
#dyn.load("tinyfiledialogs64.dll")


# R interface to tinyfd C functions

tinyfd_beep <- function() {
  result <- .C("tinyfd_beep")
  return(result)
}


tinyfd_notifyPopup <- function(aTitle, aMessage, aIconType)
{
  result <- .C("tinyfd_notifyPopup",
                charToRaw(aTitle),
                charToRaw(aMessage),
                charToRaw(aIconType))

  return(result)
}


tinyfd_messageBox <- function(aTitle , aMessage , aDialogType , aIconType , aDefaultButton)
{
  result <- .C("tfd_messageBox",
                charToRaw(aTitle),
                charToRaw(aMessage),
                charToRaw(aDialogType),
                charToRaw(aIconType),
		lDefaultButton = aDefaultButton )

  return(result$lDefaultButton)
}


tinyfd_inputBox <- function(aTitle , aMessage , aDefaultInput)
{
  result <- .C("tfd_inputBox",
                charToRaw(aTitle),
                charToRaw(aMessage),
		lDefaultInput = aDefaultInput )

  if ( result$lDefaultInput == "NULL" ) return()
  else return(result$lDefaultInput)
}


tinyfd_selectFolderDialog <- function(aTitle, aDefaultPath)
{
  result <- .C("tfd_selectFolderDialog",
                charToRaw(aTitle),
                charToRaw(aDefaultPath),
		lSelectedFolder = "" )

  if ( result$lSelectedFolder == "NULL" ) return()
  else return(result$lSelectedFolder)
}


# R calls to tinyfd functions

tinyfd_beep()
tinyfd_notifyPopup( "a title" , "a message", "warning" )
tinyfd_messageBox( "a title" , "a message" , "yesno" , "info" , as.integer(1) )
tinyfd_inputBox( "a title" , "a message" , "Lalala" )
tinyfd_selectFolderDialog( "a title" , "/Users/bardos/Devs" )
