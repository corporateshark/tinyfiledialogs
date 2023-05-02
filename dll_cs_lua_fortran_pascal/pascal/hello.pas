{ _________
 /         \ tinyfiledialogs v3.13 [May 2, 2023] zlib licence
 |tiny file|
 | dialogs | Copyright (c) 2014 - 2023 Guillaume Vareille http://ysengrin.com
 \____  ___/ http://tinyfiledialogs.sourceforge.net
      \|     git clone http://git.code.sf.net/p/tinyfiledialogs/code tinyfd

 - License -
 This software is provided 'as-is', without any express or implied
 warranty.  In no event will the authors be held liable for any damages
 arising from the use of this software.
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:
 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software.  If you use this software
 in a product, an acknowledgment in the product documentation would be
 appreciated but is not required.
 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.
 3. This notice may not be removed or altered from any source distribution.
         ___________________________________________________________
        |                                                           |
        |     If you like this new PASCAL module please upvote      |
        |        my stackoverflow answer on the PASCAL post         |
        |            https://stackoverflow.com/a/59657117           |
        |___________________________________________________________|
}

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
