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

unit Telegram.Bot;

interface

uses
System.SysUtils, System.Classes, Telegram.Core,
System.Net.Mime, Rest.Json, JSON, Telegram.API.Types, System.Generics.Collections

{$IFDEF VCL}
,VCL.Dialogs
{$ENDIF}

{$IFDEF FMX}
,FMX.Dialogs;
{$ENDIF};


type

  TEmojiDice = record
  const
    Dice ='🎲';
    Basketball = '🏀';
    Bowling = '🎳';
    Football = '⚽';
    SlotMachine ='🎰';
    Bullseye = '🎯';
  end;

  TTelegramDic = TDictionary<string,string>;

  TTelegramBot = class(TComponent)
  private
     FBotToken     : String;
     procedure SetBotToken(const AToken :String);
     function CommonDefRequest  <T:class,constructor>(AEndPoint: String):T;
     function CommonRequest     <T:class,constructor>(AEndPoint: String; AParams : TStringList; AOptions: TStringList=nil):T;
     function CommonRequestFile <T:class,constructor>(AEndPoint: String; AParams : TMultipartFormData; AOptions: TTelegramDic):T;
     procedure SplitArray(inputArray: TArray<TTelegramInlineKeyBoardButton>; var outputArray: TArrayInKeyboards; ALimit:Integer);
  public

     constructor Create(AOwner: TComponent); override;
     destructor  Destroy; override;

     function GetMe : TTelegramUser;
     function LogOut : Boolean;
     function Close : Boolean;

     function SendMessage    (AChatId: String; AText      : String; AOptions  :TStringList=nil): TTelegramMessage;
     function ForwardMessage (AChatId: String; AfromChatId: String; AMessageId: Integer; AOptions:TStringList=nil): TTelegramMessage;
     function CopyMessage    (AChatId: String; AfromChatId: String; AMessageId: Integer; AOptions:TStringList=nil): TTelegramMessageId;

     function SendPhoto     (AChatId, APhotoPath: String; ACaption : String=''; AOptions : TTelegramDic=nil): TTelegramMessage;
     function SendAudio     (AChatId, AAudioPath: String; ACaption : String=''; AOptions : TTelegramDic=nil): TTelegramMessage;
     function SendDocument  (AChatId: String; ADocument: String; AOptions : TTelegramDic=nil): TTelegramMessage;
     function SendVideo     (AChatId: String; AVideo: String; AOptions : TTelegramDic=nil): TTelegramMessage;
     function SendAnimation (AChatId: String; AAnimation: String; AOptions : TTelegramDic=nil): TTelegramMessage;

     function SendVoice (AChatId: String; AVoice: String; AOptions : TTelegramDic=nil): TTelegramMessage;
     function SendVideoNote (AChatId: String; AVideoNote: String; AOptions : TTelegramDic=nil): TTelegramMessage;

     function SendLocation (AChatId: String; ALatitude, ALongitude: double; AOptions:TStringList=nil): TTelegramMessage;
     function SendVenue (AChatId: String; ALatitude, ALongitude: double; Atitle, AAddress: String; AOptions:TStringList=nil): TTelegramMessage;
     function SendContact (AChatId: String; APhoneNumber, AFirstName: String; AOptions:TStringList=nil): TTelegramMessage;

     function SendPoll(AChatId:String; AQuestion: String; AAnswers : TStringList; AOptions : TStringList=nil) : TTelegramMessage;
     function SendDice(AChatId: String; AEmoji: String = ''; AOptions:TStringList=nil): TTelegramMessage;

     function GetUpdates(Alimit:Integer=100;AOffSet:Integer =-1;ATimeOut:Integer=0;AOptions:TStringList=nil):TTelegramUpdateArray;
     function GetFile(AFileId: String): TTelegramFile;


     function BanChatMember(AChatId: String; AUserId: Integer; AOptions:TStringList=nil): Boolean;
     function UnBanChatMember(AChatId: String; AUserId: Integer; AOptions:TStringList=nil): Boolean;

     function CreateChatInviteLink(AChatId: String; AOptions:TStringList=nil): TTelegramChatInviteLink;
     function RevokeChatInviteLink(AChatId: String; Ainvite_link: String) : TTelegramChatInviteLink;


     function ExportChatInviteLink(AChatId: String): String;


     function ApproveChatJoinRequest(AChatId: String; AUserId: Integer): Boolean;
     function DeclineChatJoinRequest(AChatId: String; AUserId: Integer): Boolean;

     function DeleteChatPhoto(AChatId: String): Boolean;
     function SetChatTitle(AChatId: String; Atitle: String): Boolean;
     function SetChatDescription(AChatId: String;ADescription: String = ''): Boolean;

     function LeaveChat(AChatId: String): Boolean;
     function GetChat(AChatId: String): TTelegramChat;


     function SetMyName(AName: String = ''; AlanguageCode: String = ''): Boolean;
     function GetMyName(AlanguageCode: String = ''): TTelegramBotName;

     function SetMyDescription(ADescription: String = '';AlanguageCode: String = ''): Boolean;
     function GetMyDescription(AlanguageCode: String = ''): TTelegramBotDescription;

     function GenInlineKeyBoard(AButtons:TList<TTelegramInlineKeyBoardButton>; AlimitValue:Integer=3) : String;

  published
    property BotKey : String  read FBotToken   write SetBotToken;

  end;


procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('Telegram',[TTelegramBot]);
end;

{ TTelegramBot }

constructor TTelegramBot.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TTelegramBot.Destroy;
begin
  CloseTelegramBot;
  inherited;
end;

procedure TTelegramBot.SetBotToken(const AToken: String);
begin
   FBotToken := AToken;
  _URLREADY  := _URLBASE.Replace('{BOT_TOKEN}',AToken);
  _URLFILE   := _URLBASE_FILE.Replace('{BOT_TOKEN}',AToken);
end;

function TTelegramBot.ApproveChatJoinRequest(AChatId: String;
  AUserId: Integer): Boolean;
const
  _ENDPOINT = 'approveChatJoinRequest';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('user_id='+AUserId.ToString);
     var LResponse   := POST(_ENDPOINT,LParams);
      if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.BanChatMember(AChatId: String; AUserId: Integer;
  AOptions: TStringList): Boolean;
const
  _ENDPOINT = 'banChatMember';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('user_id='+AUserId.ToString);
     if (AOptions<>nil) and (AOptions.Count>0) then LParams.AddStrings(AOptions);
     var LResponse   := POST(_ENDPOINT,LParams);
     if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.Close: Boolean;
const
  _ENDPOINT = 'close';
begin
   result := false;
   try
     var LResponse   := GET(_ENDPOINT);
     var LAccessResp := ACCESS(LResponse);
     if not LAccessResp.IsEmpty then
     begin
     result :=LAccessResp.ToBoolean();
     end;
   finally
   /// Except
   end;
end;

function TTelegramBot.CommonDefRequest<T>(AEndPoint: String): T;
begin
  var LResponse   := GET(AEndPoint);
  var LAccessResp := ACCESS(LResponse);
  if not LAccessResp.IsEmpty then
  begin
   result := TJSON.JsonToObject<T>(LAccessResp,[joIgnoreEmptyArrays,joIgnoreEmptyStrings]);
  end;
end;

function TTelegramBot.CommonRequest<T>(AEndPoint: String; AParams,
  AOptions: TStringList): T;
begin
  if (AOptions<>nil) and (AOptions.Count>0) then AParams.AddStrings(AOptions);
  try
    var LResponse   := POST(AEndPoint,AParams);
    var LAccessResp := ACCESS(LResponse);
    if not LAccessResp.IsEmpty then
    begin
    result := TJSON.JsonToObject<T>(LAccessResp,[joIgnoreEmptyArrays,joIgnoreEmptyStrings]);
    end;
  except
      on E : Exception do
      {$IFDEF VCL} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
      {$IFDEF FMX} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
  end;
end;

function TTelegramBot.CommonRequestFile<T>(AEndPoint: String; AParams : TMultipartFormData;
  AOptions: TTelegramDic): T;
begin
  try
    var LResponse   := POST_FILE(AEndPoint,AParams);
    var LAccessResp := ACCESS(LResponse);
    if not LAccessResp.IsEmpty then
    result := TJSON.JsonToObject<T>(LAccessResp,[joIgnoreEmptyArrays,joIgnoreEmptyStrings]);
  except
      on E : Exception do
      {$IFDEF VCL} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
      {$IFDEF FMX} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
  end;
end;

function TTelegramBot.CopyMessage(AChatId, AfromChatId: String;
  AMessageId: Integer; AOptions: TStringList): TTelegramMessageId;
const
  _ENDPOINT = 'copyMessage';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('from_chat_id='+AfromChatId);
     LParams.Add('message_id='+AMessageId.ToString);
     result := CommonRequest<TTelegramMessageId>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.CreateChatInviteLink(
  AChatId: String; AOptions:TStringList=nil): TTelegramChatInviteLink;
const
  _ENDPOINT = 'createChatInviteLink';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     result := CommonRequest<TTelegramChatInviteLink>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.DeclineChatJoinRequest(AChatId: String;
  AUserId: Integer): Boolean;
const
  _ENDPOINT = 'declineChatJoinRequest';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('user_id='+AUserId.ToString);
     var LResponse   := POST(_ENDPOINT,LParams);
      if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.DeleteChatPhoto(AChatId: String): Boolean;
const
  _ENDPOINT = 'deleteChatPhoto';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     var LResponse   := POST(_ENDPOINT,LParams);
      if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.ExportChatInviteLink(AChatId: String): String;
const
  _ENDPOINT = 'exportChatInviteLink';
begin
   result := '';
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     var LResponse   := POST(_ENDPOINT,LParams);
     result := ACCESS(LResponse);
   finally
     LParams.DisposeOf;
   end
end;

function TTelegramBot.ForwardMessage(AChatId, AfromChatId: String;
  AMessageId: Integer; AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'forwardMessage';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('from_chat_id='+AfromChatId);
     LParams.Add('message_id='+AMessageId.ToString);
     result := CommonRequest<TTelegramMessage>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.GenInlineKeyBoard(
  AButtons: TList<TTelegramInlineKeyBoardButton>; AlimitValue: Integer): String;
var
  LButtonArray : TArray<TTelegramInlineKeyBoardButton>;
  LlineKeyBoard: TTelegramInlineKeyBoardMarkup;
  LTemp        : TArray<TArray<TTelegramInlineKeyboardButton>>;
  I,J,K        : Integer;
begin

  if (AButtons = nil) or (AButtons.Count = 0) then Exit;

  SetLength(LButtonArray, AButtons.Count);
  for I := 0 to AButtons.Count - 1 do LButtonArray[I] := AButtons.Items[I];
  LlineKeyBoard := TTelegramInlineKeyBoardMarkup.Create;

  SplitArray(LButtonArray,LTemp,AlimitValue);

  LlineKeyBoard.inline_keyboard := LTemp;

  Result := TJSON.ObjectToJsonString(LlineKeyBoard,[joIgnoreEmptyArrays,joIgnoreEmptyStrings]);

end;

function TTelegramBot.GetChat(AChatId: String): TTelegramChat;
const
  _ENDPOINT = 'getChat';
begin
   result := nil;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     var LResponse  := POST(_ENDPOINT,LParams);
     result := CommonRequest<TTelegramChat>(_ENDPOINT,LParams);
    except
      on E: Exception do
      {$IFDEF VCL} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
      {$IFDEF FMX} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
   end;
   LParams.DisposeOf;
end;

function TTelegramBot.GetFile(AFileId: String): TTelegramFile;
const
  _ENDPOINT = 'getFile';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('file_id='+AFileId);
     result := CommonRequest<TTelegramFile>(_ENDPOINT,LParams,nil);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.GetMe: TTelegramUser;
const
  _ENDPOINT = 'getMe';
begin
   result := nil;
   try
    result := CommonDefRequest<TTelegramUser>(_ENDPOINT);
   except
     on E: Exception do
     {$IFDEF VCL} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
     {$IFDEF FMX} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
   end;
end;


function TTelegramBot.GetMyDescription(AlanguageCode: String): TTelegramBotDescription;
const
  _ENDPOINT = 'GetMyDescription';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('language_code='+AlanguageCode);
     result := CommonRequest<TTelegramBotDescription>(_ENDPOINT,LParams);
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.GetMyName(AlanguageCode: String): TTelegramBotName;
const
  _ENDPOINT = 'getMyName';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('language_code='+AlanguageCode);
     var LResponse := POST(_ENDPOINT,LParams);
     result := CommonRequest<TTelegramBotName>(_ENDPOINT,LParams);
   finally
     LParams.DisposeOf;
   end;
end;


function TTelegramBot.GetUpdates(Alimit:Integer;AOffSet:Integer;ATimeOut:Integer;AOptions: TStringList): TTelegramUpdateArray;
const
  _ENDPOINT = 'getUpdates';
begin
  result := nil;
 var LParams := TStringList.Create;
 var LJsonArray := TJSONArray.Create('message','channel_post');
   try
     if (AOptions<>nil) and (AOptions.Count>0) then
     begin
      for var I:=LJsonArray.Count-1 downto 0 do LJsonArray.Remove(I);
      for var Item in AOptions do LJsonArray.Add(Item);
     end;
     LParams.Add('limit='+ Alimit.ToString);
     LParams.Add('offset='+ AOffSet.ToString);
     LParams.Add('timeout='+ ATimeOut.ToString);
     LParams.Add('allowed_updates='+LJsonArray.ToJSON);
     var LResponse := POST(_ENDPOINT,LParams);
     result := TJSON.JsonToObject<TTelegramUpdateArray>(LResponse,[joIgnoreEmptyArrays,joIgnoreEmptyStrings]);
   Except
      on E : Exception do
      {$IFDEF VCL} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
      {$IFDEF FMX} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
   end;
end;

function TTelegramBot.LeaveChat(AChatId: String): Boolean;
const
  _ENDPOINT = 'leaveChat';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     var LResponse  := POST(_ENDPOINT,LParams);
      if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
    except
      on E: Exception do
      {$IFDEF VCL} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
      {$IFDEF FMX} ShowMessage('Error TNetHTTPClient : ' + E.Message); {$ENDIF}
   end;
   LParams.DisposeOf;
end;

function TTelegramBot.LogOut: Boolean;
const
  _ENDPOINT = 'logOut';
begin
   result := false;
   try
     var LResponse   := GET(_ENDPOINT);
     var LAccessResp := ACCESS(LResponse);
     if not LAccessResp.IsEmpty then
     begin
     result :=LAccessResp.ToBoolean();
     end;
   finally
   /// Except
   end;

end;


function TTelegramBot.RevokeChatInviteLink(AChatId,
  Ainvite_link: String): TTelegramChatInviteLink;
const
  _ENDPOINT = 'revokeChatInviteLink';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('invite_link='+Ainvite_link);
     result := CommonRequest<TTelegramChatInviteLink>(_ENDPOINT,LParams);
   finally
    LParams.DisposeOf;
   end;


end;

function TTelegramBot.SendAnimation(AChatId, AAnimation: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendAnimation';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;
begin
  LParam := TMultipartFormData.Create;
 try
  LParam.AddField('chat_id',AChatId);
  LParam.AddFile('animation',AAnimation);

  if (AOptions<>nil) and (AOptions.Count>0) then
  for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

  result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
  LParam.DisposeOf;
 end;

end;


function TTelegramBot.SendAudio(AChatId, AAudioPath, ACaption: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendAudio';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;
begin
 LParam := TMultipartFormData.Create;
 try
   LParam.AddFile('audio',AAudioPath);
   LParam.AddField('chat_id',AChatId);
   LParam.AddField('caption',ACaption);

   if (AOptions<>nil) and (AOptions.Count>0) then
   for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

   result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
   LParam.DisposeOf;
 end;
end;

function TTelegramBot.SendContact(AChatId, APhoneNumber, AFirstName: String;
  AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'SendContact';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('phone_number='+APhoneNumber);
     LParams.Add('first_name='+AFirstName);
     result := CommonRequest<TTelegramMessage>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.SendDice(AChatId, AEmoji: String;
  AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'sendDice';
begin
   result := nil;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('emoji='+AEmoji);
     if (AOptions<>nil) and (AOptions.Count>0) then LParams.AddStrings(AOptions);
     var LResponse   := POST(_ENDPOINT,LParams);
     var LAccessResp := ACCESS(LResponse);
     if not LAccessResp.IsEmpty then
     begin
     result := TJSON.JsonToObject<TTelegramMessage>(LAccessResp,
     [joIgnoreEmptyArrays,joIgnoreEmptyStrings]);
     end;
   finally
    LParams.DisposeOf;
   end;

end;

function TTelegramBot.SendDocument(AChatId, ADocument: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendDocument';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;

begin
  LParam := TMultipartFormData.Create;
 try
  LParam.AddField('chat_id',AChatId);
  LParam.AddFile('document',ADocument);

  if (AOptions<>nil) and (AOptions.Count>0) then
  for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

  result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
  LParam.DisposeOf;
 end;
end;

function TTelegramBot.SendLocation(AChatId: String; ALatitude,
  ALongitude: double; AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'SendLocation';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('latitude='+ALatitude.ToString);
     LParams.Add('longitude='+ALongitude.ToString);
     result := CommonRequest<TTelegramMessage>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.SendMessage(AChatId, AText: String;
  AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'sendMessage';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('text='+AText);
     result := CommonRequest<TTelegramMessage>(_ENDPOINT,LParams,AOptions);
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.SendPhoto(AChatId, APhotoPath, ACaption: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendPhoto';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;

begin
  LParam := TMultipartFormData.Create;
 try
  LParam.AddFile('photo',APhotoPath);
  LParam.AddField('chat_id',AChatId);
  LParam.AddField('caption',ACaption);

  if (AOptions<>nil) and (AOptions.Count>0) then
  for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

  result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
  LParam.DisposeOf;
 end;
end;

function TTelegramBot.SendPoll(AChatId, AQuestion: String;
  AAnswers: TStringList; AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'sendPoll';
begin
   var LParams    := TStringList.Create;
   var LJsonArray := TJSONArray.Create;
   try
     for var Item in AAnswers do LJsonArray.Add(Item);
     LParams.Add('chat_id='+AChatId);
     LParams.Add('question='+AQuestion);
     LParams.Add('options='+LJsonArray.ToJSON);
     result := CommonRequest<TTelegramMessage>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.SendVenue(AChatId: String; ALatitude,
  ALongitude: double; Atitle, AAddress: String;
  AOptions: TStringList): TTelegramMessage;
const
  _ENDPOINT = 'SendVenue';
begin
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('latitude='+ALatitude.ToString);
     LParams.Add('longitude='+ALongitude.ToString);
     LParams.Add('titile='+Atitle);
     LParams.Add('address='+AAddress);
     result := CommonRequest<TTelegramMessage>(_ENDPOINT,LParams,AOptions);
   finally
    LParams.DisposeOf;
   end;
end;

function TTelegramBot.SendVideo(AChatId, AVideo: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendDocument';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;
begin
  LParam := TMultipartFormData.Create;
 try
  LParam.AddField('chat_id',AChatId);
  LParam.AddFile('video',AVideo);

  if (AOptions<>nil) and (AOptions.Count>0) then
  for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

  result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
  LParam.DisposeOf;
 end;
end;

function TTelegramBot.SendVideoNote(AChatId, AVideoNote: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendVideoNote';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;
begin
  LParam := TMultipartFormData.Create;
 try
  LParam.AddField('chat_id',AChatId);
  LParam.AddFile('voice_note',AVideoNote);

  if (AOptions<>nil) and (AOptions.Count>0) then
  for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

  result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
  LParam.DisposeOf;
 end;
end;

function TTelegramBot.SendVoice(AChatId, AVoice: String;
  AOptions: TTelegramDic): TTelegramMessage;
const
  _ENDPOINT = 'sendVoice';
var
 LParam : TMultipartFormData;
 Pair : TPair <string,string>;
begin
  LParam := TMultipartFormData.Create;
 try
  LParam.AddField('chat_id',AChatId);
  LParam.AddFile('voice',AVoice);

  if (AOptions<>nil) and (AOptions.Count>0) then
  for Pair in AOptions do LParam.AddField(Pair.Key, Pair.Value);

  result := CommonRequestFile<TTelegramMessage>(_ENDPOINT,LParam,AOptions);
 finally
  LParam.DisposeOf;
 end;


end;


function TTelegramBot.SetChatDescription(AChatId,
  ADescription: String): Boolean;
const
  _ENDPOINT = 'setChatDescription';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('description='+ADescription);
     var LResponse   := POST(_ENDPOINT,LParams);
     if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.SetChatTitle(AChatId, Atitle: String): Boolean;
const
  _ENDPOINT = 'setChatTitle';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('title='+Atitle);
     var LResponse   := POST(_ENDPOINT,LParams);
      if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.SetMyDescription(ADescription,
  AlanguageCode: String): Boolean;
const
  _ENDPOINT = 'setMyDescription';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('description='+ADescription);
     LParams.Add('language_code='+AlanguageCode);
     var LResponse   := POST(_ENDPOINT,LParams);
     if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

function TTelegramBot.SetMyName(AName, AlanguageCode: String): Boolean;
const
  _ENDPOINT = 'setMyName';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('name='+AName);
     LParams.Add('language_code='+AlanguageCode);
     var LResponse   := POST(_ENDPOINT,LParams);
     if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;


procedure TTelegramBot.SplitArray(
  inputArray: TArray<TTelegramInlineKeyBoardButton>;
  var outputArray: TArrayInKeyboards; ALimit: Integer);
var
  i, j: Integer;
  currentRow: TArray<TTelegramInlineKeyBoardButton>;
begin
  // Initialize the output array
  SetLength(outputArray, 0);

  // Iterate through the input array
  for i := 0 to Length(inputArray) - 1 do
  begin
    // If the current row is full, start a new row
    if Length(currentRow) = ALimit then
    begin
      SetLength(outputArray, Length(outputArray) + 1);
      outputArray[High(outputArray)] := currentRow;
      SetLength(currentRow, 0);
    end;

    // Add the current element to the current row
    SetLength(currentRow, Length(currentRow) + 1);
    currentRow[High(currentRow)] := inputArray[i];
  end;

  // Add the last row if it is not empty
  if Length(currentRow) > 0 then
  begin
    SetLength(outputArray, Length(outputArray) + 1);
    outputArray[High(outputArray)] := currentRow;
  end;
end;

function TTelegramBot.UnBanChatMember(AChatId: String; AUserId: Integer;
  AOptions: TStringList): Boolean;
const
  _ENDPOINT = 'unbanChatMember';
begin
   result := false;
   var LParams := TStringList.Create;
   try
     LParams.Add('chat_id='+AChatId);
     LParams.Add('user_id='+AUserId.ToString);
     if (AOptions<>nil) and (AOptions.Count>0) then LParams.AddStrings(AOptions);
     var LResponse   := POST(_ENDPOINT,LParams);
      if not (ACCESS(LResponse)='') then result := ACCESS(LResponse).ToBoolean();
   finally
     LParams.DisposeOf;
   end;
end;

end.
