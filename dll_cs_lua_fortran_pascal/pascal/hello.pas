program Hello ;

uses tinyfd;

var
    lCRetrunedString: String ;
    lArrayOfChar: array[0..2] of byte = (0,0,255);


begin
   writeln ('Hello tinyfd');
   tinyfd.tinyfd_beep();
   tinyfd.tinyfd_messageBox('A Title','A Message', 'ok', 'info', 1);
   lCRetrunedString := tinyfd_inputBox('A Title','A Message', 'hello tinyfd');
   writeln (lCRetrunedString);
   lCRetrunedString := tinyfd_colorChooser('A Title','', lArrayOfChar, lArrayOfChar);
   writeln (lCRetrunedString);
   lCRetrunedString := tinyfd_colorChooser('A Title','#FF0000', lArrayOfChar, lArrayOfChar);
   writeln (lArrayOfChar[0] , lArrayOfChar[1] ,lArrayOfChar[2]);
end.

{
gcc -c ../../tinyfiledialogs
fcp tinyfd.pp
fcp hello.pas
}
