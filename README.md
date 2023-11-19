# Delphi Telegram Bot Component

![Delphi Telegram Bot Component](https://github.com/aso14/DTelegram/blob/master/Assets/Telegram_logox300.png)

## Introduction
This is a Delphi Component for interacting with the Telegram Bot API. It provides a set of functions to perform various actions using the Telegram Bot platform.

- **Compatibility:** VCL, FMX
- **Tested on Delphi:** 11 Alexandria CE
- **Version:** 1.0.0 
- **Developer:** Silas AÏKO 

## Getting Started
To use this component in your Delphi project, follow these steps:

### Clone or Download the Library Source Code:

1. Clone the component repository or download the source code as a ZIP file from the [GitHub repository](https://github.com/aso14/DTelegram.git).
2. Unzip the files into a directory of your choice.

### Configure RAD Studio Library Paths:

1. Open RAD Studio and navigate to "Tools > Options... > Language > Delphi."
2. Under the "Library" section, add the "\Sources" path from the library source code to the library paths for each platform you want to compile.

### Compile and Install the Package:

1. Open the `DTelegram.dproj` file located in the "Package" folder of the component source code.
2. Compile and install the package `DTelegram.bpl`. This step may involve right-clicking on the project file and selecting "Compile" and then "Install."

## Available Functions

| Function                   | Description                                          | Example Usage
|-----------------------------|------------------------------------------------------|--------------
| **GetMe**                   | Get information about the bot.                       | `BotInfo := TelegramBot.GetMe;`
| **LogOut**                  | Log out from the bot.                                | `LoggedOut := TelegramBot.LogOut;`
| **Close**                   | Close the bot connection.                            | `Closed := TelegramBot.Close;`
| **SendMessage**             | Send a text message.                                 | `Message := TelegramBot.SendMessage(ChatId, 'Hello, Telegram!');`
| **ForwardMessage**          | Forward a message.                                   | `ForwardedMessage := TelegramBot.ForwardMessage(TargetChatId, SourceChatId, MessageId);`
| **CopyMessage**             | Copy a message.                                      | `CopiedMessageId := TelegramBot.CopyMessage(TargetChatId, SourceChatId, MessageId);`
| **SendPhoto**               | Send a photo.                                        | `PhotoMessage := TelegramBot.SendPhoto(ChatId, 'path/to/photo.jpg', 'Check this out!');`
| **SendAudio**               | Send an audio file.                                  | `AudioMessage := TelegramBot.SendAudio(ChatId, 'path/to/audio.mp3', 'Listen to this!');`
| **SendDocument**            | Send a document.                                    | `DocumentMessage := TelegramBot.SendDocument(ChatId, 'path/to/document.pdf');`
| **SendVideo**               | Send a video.                                       | `VideoMessage := TelegramBot.SendVideo(ChatId, 'path/to/video.mp4');`
| **SendAnimation**           | Send an animation (GIF).                            | `AnimationMessage := TelegramBot.SendAnimation(ChatId, 'path/to/animation.gif');`
| **SendVoice**               | Send a voice message.                               | `VoiceMessage := TelegramBot.SendVoice(ChatId, 'path/to/voice.ogg');`
| **SendVideoNote**           | Send a video note.                                  | `VideoNoteMessage := TelegramBot.SendVideoNote(ChatId, 'path/to/videonote.mp4');`
| **SendLocation**            | Send a location.                                    | `LocationMessage := TelegramBot.SendLocation(ChatId, Latitude, Longitude);`
| **SendVenue**               | Send a venue.                                       | `VenueMessage := TelegramBot.SendVenue(ChatId, Latitude, Longitude, 'Venue Title', 'Venue Address');`
| **SendContact**             | Send a contact.                                     | `ContactMessage := TelegramBot.SendContact(ChatId, '123456789', 'John Doe');`
| **SendPoll**                | Send a poll.                                        | `PollMessage := TelegramBot.SendPoll(ChatId, 'Which is your favorite color?', ['Red', 'Green', 'Blue']);`
| **SendDice**                | Send a dice.                                        | `DiceMessage := TelegramBot.SendDice(ChatId, '🎲');`
| **GetUpdates**              | Get updates from the server.                         | `Updates := TelegramBot.GetUpdates(100, -1, 0);`
| **GetFile**                 | Get information about a file.                        | `FileInfo := TelegramBot.GetFile(FileId);`
| **BanChatMember**           | Ban a chat member.                                  | `Banned := TelegramBot.BanChatMember(ChatId, UserId);`
| **UnBanChatMember**         | Unban a chat member.                                | `UnBanned := TelegramBot.UnBanChatMember(ChatId, UserId);`
| **CreateChatInviteLink**    | Create a chat invite link.                          | `InviteLink := TelegramBot.CreateChatInviteLink(ChatId);`
| **RevokeChatInviteLink**    | Revoke a chat invite link.                          | `RevokedLink := TelegramBot.RevokeChatInviteLink(ChatId, 'your_invite_link');`
| **ExportChatInviteLink**    | Export a chat invite link.                          | `ExportedLink := TelegramBot.ExportChatInviteLink(ChatId);`
| **ApproveChatJoinRequest**  | Approve a chat join request.                        | `Approved := TelegramBot.ApproveChatJoinRequest(ChatId, UserId);`
| **DeclineChatJoinRequest**  | Decline a chat join request.                        | `Declined := TelegramBot.DeclineChatJoinRequest(ChatId, UserId);`
| **DeleteChatPhoto**         | Delete the chat photo.                              | `PhotoDeleted := TelegramBot.DeleteChatPhoto(ChatId);`
| **SetChatTitle**            | Set the chat title.                                 | `TitleSet := TelegramBot.SetChatTitle(ChatId, 'New Title');`
| **SetChatDescription**      | Set the chat description.                           | `DescriptionSet := TelegramBot.SetChatDescription(ChatId, 'New Description');`
| **LeaveChat**               | Leave the chat.                                     | `LeftChat := TelegramBot.LeaveChat(ChatId);`
| **GetChat**                 | Get information about the chat.                     | `ChatInfo := TelegramBot.GetChat(ChatId);`
| **SetMyName**               | Set the bot's name.                                 | `NameSet := TelegramBot.SetMyName('New Bot Name');`
| **GetMyName**               | Get the bot's name.                                 | `BotName := TelegramBot.GetMyName();`
| **SetMyDescription**        | Set the bot's description.                          | `DescriptionSet := TelegramBot.SetMyDescription('New Bot Description');`
| **GetMyDescription**        | Get the bot's description.                          | `BotDescription := TelegramBot.GetMyDescription();`

## Examples for Available Functions

### Set up your Bot 
You need to create a bot before using this component.
- How Create your own bot : https://core.telegram.org/bots#how-do-i-create-a-bot
- Telegram Bot API documentation : https://core.telegram.org/bots/api

### Public Channel ChatId
For Public channel is super easy to find its ChatId.
```html
   Ex : https://t.me/abcdefg   ->  ChatId := @abcdefg;
```

### GetMe
Get information about the bot.
```delphi
var BotInfo := TelegramBot.GetMe;
```

### LogOut
Log out from the bot.
```delphi
var LoggedOut := TelegramBot.LogOut;
```

### Close
Close the bot connection.
```delphi
var Closed := TelegramBot.Close;
```

### SendMessage
Send a text message.
```delphi
var Message := TelegramBot.SendMessage(ChatId, 'Hello, Telegram!');
```

### ForwardMessage
Forward a message.
```delphi
var ForwardedMessage := TelegramBot.ForwardMessage(TargetChatId, SourceChatId, MessageId);
```

### CopyMessage
Copy a message.
```delphi
var CopiedMessageId := TelegramBot.CopyMessage(TargetChatId, SourceChatId, MessageId);
```

### SendPhoto
Send a photo.
```delphi

// How use AOptions
 var AOption : TTelegramDic;   // TDictionary<string,string>;
     AOption := TTelegramDic.Create;
     AOption.Add('protect_content','1');  // Example 
 var PhotoMessage := TelegramBot.SendPhoto(ChatId, 'path/to/photo.jpg', 'Check this out!',AOption);
```

### SendAudio
Send an audio file.
```delphi
var AudioMessage := TelegramBot.SendAudio(ChatId, 'path/to/audio.mp3', 'Listen to this!');
```

### SendDocument
Send a document.
```delphi
var DocumentMessage := TelegramBot.SendDocument(ChatId, 'path/to/document.pdf');
```

### SendVideo
Send a video.
```delphi
var VideoMessage := TelegramBot.SendVideo(ChatId, 'path/to/video.mp4');
```

### SendAnimation
Send an animation (GIF).
```delphi
var AnimationMessage := TelegramBot.SendAnimation(ChatId, 'path/to/animation.gif');
```

### SendVoice
Send a voice message.
```delphi
var VoiceMessage := TelegramBot.SendVoice(ChatId, 'path/to/voice.ogg');
```

### SendVideoNote
Send a video note.
```delphi
var VideoNoteMessage := TelegramBot.SendVideoNote(ChatId, 'path/to/videonote.mp4');
```

### SendLocation
Send a location.
```delphi
var LocationMessage := TelegramBot.SendLocation(ChatId, Latitude, Longitude);
```

### SendVenue
Send a venue.
```delphi
var VenueMessage := TelegramBot.SendVenue(ChatId, Latitude, Longitude, 'Venue Title', 'Venue Address');
```

### SendContact
Send a contact.
```delphi
var ContactMessage := TelegramBot.SendContact(ChatId, '123456789', 'John Doe');
```

### SendPoll
Send a poll.
```delphi

var ListAnswers := TStringList.Create;
    ListAnswers.Add('Red');
    ListAnswers.Add('Green');
    ListAnswers.Add('Blue');

//How use Option Argument 
var Option := TStringList.Create;
    Option.Add('allows_multiple_answers=1');
    Option.Add('protect_content=true');

var PollMessage := TelegramBot.SendPoll(ChatId, 'Which is your favorite color?', ListAnswers,Option);
```

### SendDice
Send a dice.
```delphi
MyEmoji := TEmojiDice.Basketball;
var DiceMessage := TelegramBot.SendDice(ChatId, MyEmoji);
```

### GetUpdates
Get updates from the server.
```delphi
//By Default : Limit = 100;  OffSet = -1; TimeOut = 0

var Updates := TelegramBot.GetUpdates(limit,AOffSet,ATimeOut);

```

### GetFile
Get information about a file.
```delphi
var FileInfo := TelegramBot.GetFile(FileId);
```

### BanChatMember
Ban a chat member.
```delphi
var Banned := TelegramBot.BanChatMember(ChatId, UserId);
```

### UnBanChatMember
Unban a chat member.
```delphi
var UnBanned := TelegramBot.UnBanChatMember(ChatId, UserId);
```

### CreateChatInviteLink
Create a chat invite link.
```delphi
var InviteLink := TelegramBot.CreateChatInviteLink(ChatId);
```

### RevokeChatInviteLink
Revoke a chat invite link.
```delphi
var RevokedLink := TelegramBot.RevokeChatInviteLink(ChatId, 'your_invite_link');
```

### ExportChatInviteLink
Export a chat invite link.
```delphi
var ExportedLink := TelegramBot.ExportChatInviteLink(ChatId);
```

### ApproveChatJoinRequest
Approve a chat join request.
```delphi
var Approved := TelegramBot.ApproveChatJoinRequest(ChatId, UserId);
```

### DeclineChatJoinRequest
Decline a chat join request.
```delphi
var Declined := TelegramBot.DeclineChatJoinRequest(ChatId, UserId);
```

### DeleteChatPhoto
Delete the chat photo.
```delphi
var PhotoDeleted := TelegramBot.DeleteChatPhoto(ChatId);
```

### SetChatTitle
Set the chat title.
```delphi
var TitleSet := TelegramBot.SetChatTitle(ChatId, 'New Title');
```

### SetChatDescription
Set the chat description.
```delphi
var DescriptionSet := TelegramBot.SetChatDescription(ChatId, 'New Description');
```

### LeaveChat
Leave the chat.
```delphi
var LeftChat := TelegramBot.LeaveChat(ChatId);
```

### GetChat
Get information about the chat.
```delphi
var ChatInfo := TelegramBot.GetChat(ChatId);
```

### SetMyName
Set the bot's name.
```delphi
var NameSet := TelegramBot.SetMyName('New Bot Name');
```

### GetMyName
Get the bot's name.
```delphi
var BotName := TelegramBot.GetMyName();
```

### SetMyDescription
Set the bot's description.
```delphi
var DescriptionSet := TelegramBot.SetMyDescription('New Bot Description');
```

### GetMyDescription
Get the bot's description.
```delphi
var BotDescription := TelegramBot.GetMyDescription();
```



## License
This library is released under the [MIT License](LICENSE).

Feel free to contribute, open issues, or provide feedback!
