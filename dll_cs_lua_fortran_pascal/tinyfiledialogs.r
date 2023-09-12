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


tinyfd_inputBox <- function(aTitle , aMessage , aDefaultInput) # "NULL" for a password box
{
  result <- .C("tfd_inputBox",
                charToRaw(aTitle),
                charToRaw(aMessage),
		lTextOutput = aDefaultInput )

  if ( result$lTextOutput == "NULL" ) return()
  else return(result$lTextOutput)
}


tinyfd_saveFileDialog <- function(aTitle, aDefaultPathAndFile)
{
  result <- .C("tfd_saveFileDialog",
                charToRaw(aTitle),
		lSaveFile = aDefaultPathAndFile )

  if ( result$lSaveFile == "NULL" ) return()
  else return(result$lSaveFile)
}


tinyfd_openFileDialog <- function(aTitle, aDefaultPathAndFile , aAllowMultipleSelects )
{
  result <- .C("tfd_openFileDialog",
                charToRaw(aTitle),
		lOpenFile = aDefaultPathAndFile ,
		aAllowMultipleSelects )

  if ( result$lOpenFile == "NULL" ) return()
  else return(result$lOpenFile)
}



tinyfd_selectFolderDialog <- function(aTitle, aDefaultPath)
{
  result <- .C("tfd_selectFolderDialog",
                charToRaw(aTitle),
		lSelectedFolder = aDefaultPath )

  if ( result$lSelectedFolder == "NULL" ) return()
  else return(result$lSelectedFolder)
}


tinyfd_colorChooser <- function(aTitle, aDefaultHexRGB) # "#FF0000"
{
  result <- .C("tfd_colorChooser",
                charToRaw(aTitle),
		lOutputHexRGB = aDefaultHexRGB )

  if ( result$lOutputHexRGB == "NULL" ) return()
  else return(result$lOutputHexRGB)
}


# R calls to tinyfd functions

tinyfd_beep()
tinyfd_notifyPopup( "a title" , "a message", "warning" )
tinyfd_messageBox( "a title" , "a message" , "yesno" , "info" , as.integer(1) )
tinyfd_inputBox( "a title" , "a message" , "NULL" ) # "NULL" for a password box
tinyfd_saveFileDialog( "a title" , "/Users/bardos/Documents/" )
tinyfd_openFileDialog( "a title" , "/Users/bardos/Documents/test.txt" , as.integer(1) )
tinyfd_selectFolderDialog( "a title" , "/Users/bardos/Devs" )
tinyfd_colorChooser( "a title" , "#FF0000" )
