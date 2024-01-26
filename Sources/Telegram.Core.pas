{*******************************************************************************
  *                                                                             *
  *   Delphi Telegram Bot Library                                               *
  *                                                                             *
  *   Developer: Silas AIKO                                                    *
  *                                                                          *
  *   Description:                                                             *
  *   This Delphi library provides functionality for interacting with the       *
  *   Telegram Bot API. It includes a set of functions to perform various       *
  *   actions using the Telegram Bot platform.                                  *
  *                                                                             *
  *   Compatibility: VCL, FMX                                                  *
  *   Tested on Delphi: 11 Alexandria  CE                                       *
  *   Version: 1.0.0                                                            *
  *                                                                             *
  *   License: MIT License (See LICENSE file for details)                        *
  *                                                                             *
  *                                                                             *
  *******************************************************************************}


unit Telegram.Core;

interface

uses
  System.SysUtils, System.Classes,FMX.Dialogs,System.JSON,System.Net.Mime,
  System.Net.HttpClientComponent, System.Net.HttpClient;


function GET(AMethod:String) : String;
function POST(AMethod:String;AParams:TStringList) : String;
function POST_FILE(AMethod:String;AParams:TMultipartFormData) : String;
function ACCESS(AResponse:String) : String;

procedure CloseTelegramBot;


const
_URLBASE      = 'https://api.telegram.org/bot{BOT_TOKEN}/';
_URLBASE_FILE = 'https://api.telegram.org/file/bot{BOT_TOKEN}/{FILE_PATH}';


var
 ClientBase : TNetHTTPClient;
_URLREADY   : String;
_URLFILE    : String;

implementation


procedure CloseTelegramBot;
begin
  FreeAndNil(ClientBase);
end;

function GET(AMethod:String):String;
var
 LURL : String;
begin
   Result := EmptyStr;
   LURL   := _URLREADY + AMethod;
   try
    Result := ClientBase.Get(LURL).ContentAsString(TEncoding.UTF8);
   except
     on E : ENetHTTPClientException do
      begin
        ShowMessage('Error TNetHTTPClient : ' + E.Message);
      end;
   end;
end;


function POST(AMethod:String;AParams:TStringList):String;
var
 LURL : String;
begin
   Result := EmptyStr;
   LURL   := _URLREADY + AMethod;
   try
    Result := ClientBase.Post(LURL,AParams).ContentAsString(TEncoding.UTF8);
   except
     on E : ENetHTTPClientException do
      begin
        ShowMessage('Error TNetHTTPClient : ' + E.Message);
      end;
   end;
end;


function POST_FILE(AMethod:String;AParams:TMultipartFormData):String;
var
 LURL : String;
begin
   Result := EmptyStr;
   LURL   := _URLREADY + AMethod;
   try
    ClientBase.ContentType := 'multipart/form-data';
    Result := ClientBase.Post(LURL,AParams).ContentAsString(TEncoding.UTF8);
   except
     on E : ENetHTTPClientException do
      begin
        ShowMessage('Error TNetHTTPClient : ' + E.Message);
      end;
   end;
   ClientBase.ContentType := 'x-www-form-urlencoded';
end;

function ACCESS(AResponse:String) : String;
var
 AJSONObject : TJSONObject;
begin
  result := EmptyStr;
  if AResponse.IsEmpty then Exit;
  AJSONObject := TJSONObject.Create;
  try
   AJSONObject.Parse(TEncoding.UTF8.GetBytes(AResponse),0);
   if AJSONObject.GetValue('ok').Value.ToBoolean = true then
    begin
      var Lvalue := AJSONObject.GetValue('result');
      if Lvalue<>nil then
       begin
       result:=LValue.ToString;
      end;
    end;
  finally
  AJSONObject.DisposeOf;
  end;
end;


initialization
  ClientBase := TNetHTTPClient.Create(nil);
  ClientBase.ContentType  := 'x-www-form-urlencoded';
end.
