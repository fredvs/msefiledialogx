unit main;

{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface

uses
 msetypes,mseglob,mseguiglob,mseguiintf,mseapplication,msestat,msemenus,msegui,
 msegraphics,msegraphutils,mseevent,mseclasses,msewidgets,mseforms,mseact,
 msebitmap,msedataedits,msedatanodes,msedragglob,msedropdownlist,mseedit,
 msegrids,msegridsglob,mseificomp,mseificompglob,mseifiglob,mselistbrowser,
 msestatfile,msestream,msesys,SysUtils,msesimplewidgets,msedispwidgets,
 mserichstring,msegraphedits,msescrollbar,msefiledialogx, msesplitter;

{msefiledialogx in last position (or after msefiledialog) will override it}

type
  tmainfo = class(tmainform)
    tbutton1: TButton;
    tstringdisp1: tstringdisp;
    tgroupbox1: tgroupbox;
    b_fdk_open: tbooleaneditradio;
    b_fdk_save: tbooleaneditradio;
    b_fdk_dir: tbooleaneditradio;
    b_fdk_none: tbooleaneditradio;
    b_fdk_new: tbooleaneditradio;
    thefilter: tstringedit;
    thetitle: tstringedit;
    custtitle: tbooleanedit;
    thebasedir: tstringedit;
   tfiledialog1: tfiledialog;
   fontname: tdropdownlistedit;
   fontheight: tintegeredit;
   tbutton2: tbutton;
    procedure onex(const Sender: TObject);
   procedure onclose(const sender: TObject);
  end;

var
  mainfo: tmainfo;

implementation

uses
  main_mfm;

procedure tmainfo.onex(const Sender: TObject);
var
  dialogkind: filedialogkindty;
   ara, arb: msestringarty;

 begin
  if b_fdk_open.Value then
    dialogkind := fdk_open
  else if b_fdk_save.Value then
    dialogkind := fdk_save
  else if b_fdk_dir.Value then
    dialogkind := fdk_dir
  else if b_fdk_none.Value then
    dialogkind := fdk_none
  else if b_fdk_new.Value then
    dialogkind := fdk_new;

  tfiledialog1.controller.captionopen := 'Open File';
  tfiledialog1.controller.captionsave := 'Save File as';
  tfiledialog1.controller.captiondir  := 'Open Directory';
  
    setlength(ara,5);
    setlength(arb,5);
    
    ara[0] := 'Pascal';
    ara[1] := 'C';
    ara[2] := 'Java';
    ara[3] := 'Python';
    ara[4] := 'All';
      
    arb[0] := '"*.pp" "*.pas" "*.inc" "*.dpr" "*.lpr"';
    arb[1] := '"*.c" "*.cpp" "*.h"';
    arb[2] := '"*.java"';
    arb[3] := '"*.py"';
    arb[4] := '"*.*"';
          
   tfiledialog1.controller.filterlist.asarraya := ara;
   tfiledialog1.controller.filterlist.asarrayb := arb;
  
   tfiledialog1.controller.filter  := thefilter.Value;
  
   tfiledialog1.controller.basedir := thebasedir.Value;
  
   tfiledialog1.controller.fontheight := fontheight.value; // font height of dialogfile
   tfiledialog1.controller.fontname := fontname.value; // font name of dialogfile
   tfiledialog1.controller.fontcolor := cl_black; // font color of dialogfile
   tfiledialog1.controller.backcolor := cl_gray; // background color of dialogfile
  
  if custtitle.Value then
  begin
    if tfiledialog1.controller.Execute(dialogkind, thetitle.Value) = mr_ok then
      tstringdisp1.Text := tfiledialog1.controller.filename;
  end
  else if tfiledialog1.controller.Execute(dialogkind) = mr_ok then
    tstringdisp1.Text := tfiledialog1.controller.filename;

end;

procedure tmainfo.onclose(const sender: TObject);
begin
close;
end;

end.

