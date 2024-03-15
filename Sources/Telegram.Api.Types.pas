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

unit Telegram.Api.Types;

interface
uses
  System.Generics.Collections;


  type

  TTelegramChatPhoto = class;
  TTelegramMessage = class;
  TTelegramChatPermissions = class;
  TTelegramChatLocation = class;
  TTelegramMessageEntity = class;
  TTelegramAnimation = class;
  TTelegramAudio = class;
  TTelegramDocument = class;
  TTelegramPhotoSize = class;
  TTelegramVideo = class;
  TTelegramVideoNote = class;
  TTelegramVoice = class;
  TTelegramContact = class;
  TTelegramPoll = class;
  TTelegramVenue = class;
  TTelegramLocation = class;
  TTelegramMessageAutoDeleteTimerChanged = class;
  TTelegramUserShared = class;
  TTelegramChatShared = class;
  TTelegramWriteAccessAllowed = class;
  TTelegramProximityAlertTriggered = class;
  TTelegramForumTopicCreated = class;
  TTelegramForumTopicEdited = class;
  TTelegramForumTopicClosed = class;
  TTelegramForumTopicReopened = class;
  TTelegramGeneralForumTopicHidden = class;
  TTelegramGeneralForumTopicUnhidden = class;
  TTelegramVideoChatScheduled = class;
  TTelegramVideoChatStarted = class;
  TTelegramVideoChatEnded = class;
  TTelegramVideoChatParticipantsInvited = class;
  TTelegramWebAppData = class;
  TTelegramInlineKeyboardMarkup = class;
  TTelegramKeyboardButton = class;
  TTelegramLoginUrl = class;
  TTelegramSwitchInlineQueryChosenChat = class;
  TTelegramOrigin = class;

  TTelegramKeyboardButtonRequestUser = class;
  TTelegramKeyboardButtonRequestChat = class;
  TTelegramKeyboardButtonPollType = class;
  TTelegramWebAppInfo = class;
  TTelegramInlineKeyboardButton = class;


  TTelegramInlineQuery        = class;
  TTelegramChosenInlineResult = class;
  TTelegramCallbackQuery      = class;
  TTelegramShippingQuery      = class;
  TTelegramPreCheckoutQuery   = class;
  TTelegramShippingAddress    = class;
  TTelegramOrderInfo = class;

  TTelegramBotDescription = class
    private
     Fdescription : string;
    public
     property description : string read Fdescription write Fdescription;
  end;

  TTelegramUser = class
  private
    Fid: Integer;
    Fis_bot: Boolean;
    Ffirst_name: String;
    Flast_name: String;
    Fusername: String;
    Flanguage_code               : String;
    FIs_premium                  : Boolean;
    Fadded_to_attachment_menu    : Boolean;
    Fcan_join_groups: Boolean;
    Fcan_read_all_group_messages: Boolean;
    Fsupports_inline_queries: Boolean;
  public
    property id: Integer read Fid write Fid;
    property is_bot: Boolean read Fis_bot write Fis_bot;
    property first_name: String read Ffirst_name write Ffirst_name;
    property last_name: String read Flast_name write Flast_name;
    property username: String read Fusername write Fusername;
    property language_code : String  read Flanguage_code write Flanguage_code;
    property is_premium : Boolean read FIs_premium write FIs_premium;
    property added_to_attachment_menu : Boolean read Fadded_to_attachment_menu    write Fadded_to_attachment_menu;
    property can_join_groups: Boolean read Fcan_join_groups write Fcan_join_groups;
    property can_read_all_group_messages: Boolean read Fcan_read_all_group_messages write Fcan_read_all_group_messages;
    property supports_inline_queries: Boolean read Fsupports_inline_queries write Fsupports_inline_queries;
  end;

  TTelegramChat = class
  private
    Fid: Integer;
    Ftype: String;
    Ftitle: String;
    Fusername: String;
    Ffirst_name: String;
    Flast_name: string;
    Fis_forum: Boolean;
    Fphoto: TTelegramChatPhoto;
    Factive_usernames: TArray<String>;
    Femoji_status_custom_emoji_id: String;
    Femoji_status_expiration_date: Integer;
    Fbio: String;
    Fhas_private_forwards: Boolean;
    Fhas_restricted_voice_and_video_messages: Boolean;
    Fjoin_to_send_messages: Boolean;
    Fjoin_by_request: Boolean;
    Fdescription: String;
    Finvite_link: String;
    Fpinned_message: TTelegramMessage;
    Fpermissions: TTelegramChatPermissions;
    Fslow_mode_delay: Integer;
    Fmessage_auto_delete_time: Integer;
    Fhas_aggressive_anti_spam_enabled: Boolean;
    Fhas_hidden_members: Boolean;
    Fhas_protected_content: Boolean;
    Fsticker_set_name: String;
    Fcan_set_sticker_set: Boolean;
    Flinked_chat_id: Int64;
    Flocation: TTelegramChatLocation;
  public
    property id: Integer read Fid write Fid;
    property &type: String read Ftype write Ftype;
    property title: String read Ftitle write Ftitle;
    property username: String read Fusername write Fusername;
    property first_name: String read Ffirst_name write Ffirst_name;
    property last_name: string read Flast_name write Flast_name;
    property is_forum: Boolean read Fis_forum write Fis_forum;
    property photo: TTelegramChatPhoto read Fphoto write Fphoto;
    property active_usernames: TArray<String> read Factive_usernames write Factive_usernames;
    property emoji_status_custom_emoji_id: String read Femoji_status_custom_emoji_id write Femoji_status_custom_emoji_id;
    property emoji_status_expiration_date: Integer read Femoji_status_expiration_date write Femoji_status_expiration_date;

    property bio: String read Fbio write Fbio;
    property has_private_forwards: Boolean read Fhas_private_forwards write Fhas_private_forwards;
    property has_restricted_voice_and_video_messages: Boolean read Fhas_restricted_voice_and_video_messages write Fhas_restricted_voice_and_video_messages;
    property join_to_send_messages: Boolean read Fjoin_to_send_messages write Fjoin_to_send_messages;
    property join_by_request: Boolean read Fjoin_by_request write Fjoin_by_request;
    property description: String read Fdescription write Fdescription;
    property invite_link: String read Finvite_link write Finvite_link;
    property pinned_message: TTelegramMessage read Fpinned_message write Fpinned_message;
    property permissions: TTelegramChatPermissions read Fpermissions write Fpermissions;
    property slow_mode_delay: Integer read Fslow_mode_delay write Fslow_mode_delay;
    property message_auto_delete_time: Integer read Fmessage_auto_delete_time write Fmessage_auto_delete_time;
    property has_aggressive_anti_spam_enabled: Boolean read Fhas_aggressive_anti_spam_enabled write Fhas_aggressive_anti_spam_enabled;
    property has_hidden_members: Boolean read Fhas_hidden_members write Fhas_hidden_members;
    property has_protected_content: Boolean read Fhas_protected_content write Fhas_protected_content;
    property sticker_set_name: String read Fsticker_set_name write Fsticker_set_name;
    property can_set_sticker_set: Boolean read Fcan_set_sticker_set write Fcan_set_sticker_set;
    property linked_chat_id: Int64 read Flinked_chat_id write Flinked_chat_id;
    property location: TTelegramChatLocation read Flocation write Flocation;
  end;

  TTelegramMessage = class
  private
    Fmessage_id: Integer;
    Fmessage_thread_id: Integer;
    Ffrom: TTelegramUser;
    Fsender_chat: TTelegramChat;
    Fchat: TTelegramChat;
    Fdate: Integer;
    Fforward_origin:TTelegramOrigin;
    Fforward_from: TTelegramUser;
    Fforward_from_chat: TTelegramChat;
    Fforward_from_message_id: Integer;
    Fforward_signature: String;
    Fforward_sender_name: String;
    Fforward_date: Integer;
    Fis_topic_message: Boolean;
    Fis_automatic_forward: Boolean;
    Freply_to_message: TTelegramMessage;
    Fvia_bot: TTelegramUser;
    Fedit_date: Integer;
    Fhas_protected_content: Boolean;
    Fmedia_group_id: String;
    Fauthor_signature: String;
    Ftext: String;
    Fentities: TArray<TTelegramMessageEntity>;
    Fanimation: TTelegramAnimation;
    Faudio: TTelegramAudio;
    Fdocument: TTelegramDocument;
    Fphoto: TArray<TTelegramPhotoSize>;
    Fvideo: TTelegramVideo;
    Fvideo_note: TTelegramVideoNote;
    Fvoice: TTelegramVoice;
    Fcaption: String;
    Fcaption_entities: TArray<TTelegramMessageEntity>;
    Fhas_media_spoiler: Boolean;
    Fcontact: TTelegramContact;
    Fpoll: TTelegramPoll;
    Fvenue: TTelegramVenue;
    Flocation: TTelegramLocation;
    Fnew_chat_members: TArray<TTelegramUser>;
    Fleft_chat_member: TTelegramUser;
    Fnew_chat_title: String;
    Fnew_chat_photo: TArray<TTelegramPhotoSize>;
    Fdelete_chat_photo: Boolean;
    Fgroup_chat_created: Boolean;
    Fsupergroup_chat_created: Boolean;
    Fchannel_chat_created: Boolean;
    Fmessage_auto_delete_timer_changed: TTelegramMessageAutoDeleteTimerChanged;
    Fmigrate_to_chat_id: Integer;
    Fmigrate_from_chat_id: Integer;
    Fpinned_message: TTelegramMessage;
    Fuser_shared: TTelegramUserShared;
    Fchat_shared: TTelegramChatShared;
    Fconnected_website: String;
    Fwrite_access_allowed: TTelegramWriteAccessAllowed;
    Fproximity_alert_triggered: TTelegramProximityAlertTriggered;
    Fforum_topic_created: TTelegramForumTopicCreated;
    Fforum_topic_edited: TTelegramForumTopicEdited;
    Fforum_topic_closed: TTelegramForumTopicClosed;
    Fforum_topic_reopened: TTelegramForumTopicReopened;
    Fgeneral_forum_topic_hidden: TTelegramGeneralForumTopicHidden;
    Fgeneral_forum_topic_unhidden: TTelegramGeneralForumTopicUnhidden;
    Fvideo_chat_scheduled: TTelegramVideoChatScheduled;
    Fvideo_chat_started: TTelegramVideoChatStarted;
    Fvideo_chat_ended: TTelegramVideoChatEnded;
    Fvideo_chat_participants_invited: TTelegramVideoChatParticipantsInvited;
    Fweb_app_data: TTelegramWebAppData;
    Freply_markup: TTelegramInlineKeyboardMarkup;
  public
    property message_id: Integer read Fmessage_id write Fmessage_id;
    property message_thread_id: Integer read Fmessage_thread_id write Fmessage_thread_id;
    property &from: TTelegramUser read Ffrom write Ffrom;
    property sender_chat: TTelegramChat read Fsender_chat write Fsender_chat;
    property date: Integer read Fdate write Fdate;
    property chat: TTelegramChat read Fchat write Fchat;
    property forward_origin: TTelegramOrigin read Fforward_origin write Fforward_origin; //новое
    property forward_from: TTelegramUser read Fforward_from write Fforward_from;
    property forward_from_chat: TTelegramChat read Fforward_from_chat write Fforward_from_chat;
    property forward_from_message_id: Integer read Fforward_from_message_id write Fforward_from_message_id;
    property forward_signature: String read Fforward_signature write Fforward_signature;
    property forward_sender_name: String read Fforward_sender_name write Fforward_sender_name;
    property forward_date: Integer read Fforward_date write Fforward_date;
    property is_topic_message: Boolean read Fis_topic_message write Fis_topic_message;
    property is_automatic_forward: Boolean read Fis_automatic_forward write Fis_automatic_forward;
    property reply_to_message: TTelegramMessage read Freply_to_message write Freply_to_message;
    property via_bot: TTelegramUser read Fvia_bot write Fvia_bot;
    property edit_date: Integer read Fedit_date write Fedit_date;
    property has_protected_content: Boolean read Fhas_protected_content write Fhas_protected_content;
    property media_group_id: String read Fmedia_group_id write Fmedia_group_id;
    property author_signature: String read Fauthor_signature write Fauthor_signature;
    property text: String read Ftext write Ftext;
    property entities: TArray<TTelegramMessageEntity> read Fentities write Fentities;
    property animation: TTelegramAnimation read Fanimation write Fanimation;
    property audio: TTelegramAudio read Faudio write Faudio;
    property document: TTelegramDocument read Fdocument write Fdocument;
    property photo: TArray<TTelegramPhotoSize> read Fphoto write Fphoto;
    property video: TTelegramVideo read Fvideo write Fvideo;
    property video_note: TTelegramVideoNote read Fvideo_note write Fvideo_note;
    property voice: TTelegramVoice read Fvoice write Fvoice;
    property caption: String read Fcaption write Fcaption;
    property caption_entities: TArray<TTelegramMessageEntity> read Fcaption_entities write Fcaption_entities;
    property has_media_spoiler: Boolean read Fhas_media_spoiler write Fhas_media_spoiler;
    property contact: TTelegramContact read Fcontact write Fcontact;
    property poll: TTelegramPoll read Fpoll write Fpoll;
    property venue: TTelegramVenue read Fvenue write Fvenue;
    property location: TTelegramLocation read Flocation write Flocation;
    property new_chat_members: TArray<TTelegramUser> read Fnew_chat_members write Fnew_chat_members;
    property left_chat_member: TTelegramUser read Fleft_chat_member write Fleft_chat_member;
    property new_chat_title: String read Fnew_chat_title write Fnew_chat_title;
    property new_chat_photo: TArray<TTelegramPhotoSize> read Fnew_chat_photo write Fnew_chat_photo;
    property delete_chat_photo: Boolean read Fdelete_chat_photo write Fdelete_chat_photo;
    property group_chat_created: Boolean read Fgroup_chat_created write Fgroup_chat_created;
    property supergroup_chat_created: Boolean read Fsupergroup_chat_created write Fsupergroup_chat_created;
    property channel_chat_created: Boolean read Fchannel_chat_created write Fchannel_chat_created;
    property message_auto_delete_timer_changed:TTelegramMessageAutoDeleteTimerChanged read Fmessage_auto_delete_timer_changed write Fmessage_auto_delete_timer_changed;
    property migrate_to_chat_id: Integer read Fmigrate_to_chat_id write Fmigrate_to_chat_id;
    property migrate_from_chat_id: Integer read Fmigrate_from_chat_id write Fmigrate_from_chat_id;
    property pinned_message: TTelegramMessage read Fpinned_message write Fpinned_message;
    property user_shared: TTelegramUserShared read Fuser_shared write Fuser_shared;
    property chat_shared: TTelegramChatShared read Fchat_shared write Fchat_shared;
    property connected_website: String read Fconnected_website  write Fconnected_website;
    property write_access_allowed: TTelegramWriteAccessAllowed  read Fwrite_access_allowed write Fwrite_access_allowed;
    property proximity_alert_triggered: TTelegramProximityAlertTriggered read Fproximity_alert_triggered write Fproximity_alert_triggered;
    property forum_topic_created: TTelegramForumTopicCreated read Fforum_topic_created write Fforum_topic_created;
    property forum_topic_edited: TTelegramForumTopicEdited read Fforum_topic_edited write Fforum_topic_edited;
    property forum_topic_closed: TTelegramForumTopicClosed read Fforum_topic_closed write Fforum_topic_closed;
    property forum_topic_reopened: TTelegramForumTopicReopened read Fforum_topic_reopened write Fforum_topic_reopened;
    property general_forum_topic_hidden: TTelegramGeneralForumTopicHidden read Fgeneral_forum_topic_hidden write Fgeneral_forum_topic_hidden;
    property general_forum_topic_unhidden: TTelegramGeneralForumTopicUnhidden read Fgeneral_forum_topic_unhidden write Fgeneral_forum_topic_unhidden;
    property video_chat_scheduled: TTelegramVideoChatScheduled read Fvideo_chat_scheduled write Fvideo_chat_scheduled;
    property video_chat_started: TTelegramVideoChatStarted read Fvideo_chat_started write Fvideo_chat_started;
    property video_chat_ended: TTelegramVideoChatEnded read Fvideo_chat_ended write Fvideo_chat_ended;
    property video_chat_participants_invited:TTelegramVideoChatParticipantsInvited read Fvideo_chat_participants_invited write Fvideo_chat_participants_invited;
    property web_app_data: TTelegramWebAppData read Fweb_app_data write Fweb_app_data;
    property reply_markup: TTelegramInlineKeyboardMarkup read Freply_markup write Freply_markup;
  end;

  TTelegramMessageId = class
  private
    Fmessage_id: Int64;
  public
    property message_id: Int64 read Fmessage_id write Fmessage_id;
  end;

  TTelegramMessageEntity = class
  private
    Ftype: String;
    Foffset: Integer;
    Flength: Integer;
    Furl: String;
    Fuser: TTelegramUser;
    Flanguage: String;
    Fcustom_emoji_id: String;
  public
    property &type: String read Ftype write Ftype;
    property offset: Integer read Foffset write Foffset;
    property length: Integer read Flength write Flength;
    property url: String read Furl write Furl;
    property user: TTelegramUser read Fuser write Fuser;
    property language: String read Flanguage write Flanguage;
    property custom_emoji_id: String read Fcustom_emoji_id
      write Fcustom_emoji_id;
  end;

    TTelegramOrigin = class
  private
    Ftype: String;
    Fdate: Integer;
    Fsender_user: TTelegramUser;
  public
    property &type: String read Ftype write Ftype;
    property date: Integer read Fdate write Fdate;
    property sender_user: TTelegramUser read Fsender_user write Fsender_user;
  end;



  TTelegramPhotoSize = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fwidth: Integer;
    Fheight: Integer;
    Ffile_size: Integer;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property width: Integer read Fwidth write Fwidth;
    property height: Integer read Fheight write Fheight;
    property file_size: Integer read Ffile_size write Ffile_size;
  end;

  TTelegramAnimation = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
    Fthumbnail: TTelegramPhotoSize;
    Ffile_name: String;
    Fmime_type: String;
    Ffile_size: Integer;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property width: Integer read Fwidth write Fwidth;
    property height: Integer read Fheight write Fheight;
    property duration: Integer read Fduration write Fduration;
    property thumbnail: TTelegramPhotoSize read Fthumbnail write Fthumbnail;
    property file_name: String read Ffile_name write Ffile_name;
    property mime_type: String read Fmime_type write Fmime_type;
    property file_size: Integer read Ffile_size write Ffile_size;
  end;

  TTelegramAudio = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fduration: Integer;
    Fperformer: String;
    Ftitle: String;
    Ffile_name: String;
    Fmime_type: String;
    Ffile_size: Integer;
    Fthumbnail: TTelegramPhotoSize;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property duration: Integer read Fduration write Fduration;
    property performer: String read Fperformer write Fperformer;
    property title: String read Ftitle write Ftitle;
    property file_name: String read Ffile_name write Ffile_name;
    property mime_type: String read Fmime_type write Fmime_type;
    property file_size: Integer read Ffile_size write Ffile_size;
    property thumbnail: TTelegramPhotoSize read Fthumbnail write Fthumbnail;
  end;

  TTelegramDocument = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fthumbnail: TTelegramPhotoSize;
    Ffile_name: String;
    Fmime_type: String;
    Ffile_size: Integer;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property thumbnail: TTelegramPhotoSize read Fthumbnail write Fthumbnail;
    property file_name: String read Ffile_name write Ffile_name;
    property mime_type: String read Fmime_type write Fmime_type;
    property file_size: Integer read Ffile_size write Ffile_size;
  end;

  TTelegramVideo = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
    Fthumbnail: TTelegramPhotoSize;
    Ffile_name: String;
    Fmime_type: String;
    Ffile_size: Integer;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property width: Integer read Fwidth write Fwidth;
    property height: Integer read Fheight write Fheight;
    property duration: Integer read Fduration write Fduration;
    property thumbnail: TTelegramPhotoSize read Fthumbnail write Fthumbnail;
    property file_name: String read Ffile_name write Ffile_name;
    property mime_type: String read Fmime_type write Fmime_type;
    property file_size: Integer read Ffile_size write Ffile_size;
  end;

  TTelegramVideoNote = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Flength: Integer;
    Fduration: Integer;
    Fthumbnail: TTelegramPhotoSize;
    Ffile_size: Integer;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property length: Integer read Flength write Flength;
    property duration: Integer read Fduration write Fduration;
    property thumbnail: TTelegramPhotoSize read Fthumbnail write Fthumbnail;
    property file_size: Integer read Ffile_size write Ffile_size;
  end;

  TTelegramVoice = class
  private
    Ffile_id: string;
    Ffile_unique_id: string;
    Fduration: Integer;
    Fmime_type: string;
    Ffile_size: Integer;
  public
    property file_id: string read Ffile_id write Ffile_id;
    property file_unique_id: string read Ffile_unique_id write Ffile_unique_id;
    property duration: Integer read Fduration write Fduration;
    property mime_type: string read Fmime_type write Fmime_type;
    property file_size: Integer read Ffile_size write Ffile_size;
  end;

  TTelegramContact = class
  private
    Fphone_number: String;
    Ffirst_name: String;
    Flast_name: String;
    Fuser_id: Integer;
    Fvcard: String;
  public
    property phone_number: String read Fphone_number write Fphone_number;
    property first_name: String read Ffirst_name write Ffirst_name;
    property last_name: String read Flast_name write Flast_name;
    property user_id: Integer read Fuser_id write Fuser_id;
    property vcard: String read Fvcard write Fvcard;
  end;

  TTelegramDice = class
  private
    Femoji: String;
    Fvalue: Integer;
  public
    property emoji: String read Femoji write Femoji;
    property value: Integer read Fvalue write Fvalue;
  end;

  TTelegramPollOption = class
  private
    Ftext: String;
    Fvoter_count: Integer;
  public
    property text: String read Ftext write Ftext;
    property voter_count: Integer read Fvoter_count write Fvoter_count;
  end;

  TTelegramPollAnswer = class
  private
    Fpoll_id: String;
    Fuser: TTelegramUser;
    Foption_ids: TArray<Integer>;
  public
    property poll_id: String read Fpoll_id write Fpoll_id;
    property user: TTelegramUser read Fuser write Fuser;
    property option_ids: TArray<Integer> read Foption_ids write Foption_ids;
  end;

  TTelegramPoll = class
  private
    Fid: String;
    Fquestion: String;
    Foptions: TArray<TTelegramPollOption>;
    Ftotal_voter_count: Integer;
    Fis_closed: Boolean;
    Fis_anonymous: Boolean;
    Ftype: String;
    Fallows_multiple_answers: Boolean;
    Fcorrect_option_id: Integer;
    Fexplanation: String;
    Fexplanation_entities: TArray<TTelegramMessageEntity>;
    Fopen_period: Integer;
    Fclose_date: Integer;
  public
    property id: String read Fid write Fid;
    property question: String read Fquestion write Fquestion;
    property options: TArray<TTelegramPollOption> read Foptions write Foptions;
    property total_voter_count: Integer read Ftotal_voter_count
      write Ftotal_voter_count;
    property is_closed: Boolean read Fis_closed write Fis_closed;
    property is_anonymous: Boolean read Fis_anonymous write Fis_anonymous;
    property &type: String read Ftype write Ftype;
    property allows_multiple_answers: Boolean read Fallows_multiple_answers
      write Fallows_multiple_answers;
    property correct_option_id: Integer read Fcorrect_option_id
      write Fcorrect_option_id;
    property explanation: String read Fexplanation write Fexplanation;
    property explanation_entities: TArray<TTelegramMessageEntity>
      read Fexplanation_entities write Fexplanation_entities;
    property open_period: Integer read Fopen_period write Fopen_period;
    property close_date: Integer read Fclose_date write Fclose_date;
  end;

  TTelegramLocation = class
  private
    Flongitude: Double;
    Flatitude: Double;
    Fhorizontal_accuracy: Double;
    Flive_period: Integer;
    Fheading: Integer;
    Fproximity_alert_radius: Integer;
  public
    property longitude: Double read Flongitude write Flongitude;
    property latitude: Double read Flatitude write Flatitude;
    property horizontal_accuracy: Double read Fhorizontal_accuracy
      write Fhorizontal_accuracy;
    property live_period: Integer read Flive_period write Flive_period;
    property heading: Integer read Fheading write Fheading;
    property proximity_alert_radius: Integer read Fproximity_alert_radius
      write Fproximity_alert_radius;
  end;

  TTelegramVenue = class
  private
    Flocation: TTelegramLocation;
    Ftitle: String;
    Faddress: String;
    Ffoursquare_id: String;
    Ffoursquare_type: String;
    Fgoogle_place_id: String;
    Fgoogle_place_type: String;
  public
    property location: TTelegramLocation read Flocation write Flocation;
    property title: String read Ftitle write Ftitle;
    property address: String read Faddress write Faddress;
    property foursquare_id: String read Ffoursquare_id write Ffoursquare_id;
    property foursquare_type: String read Ffoursquare_type
      write Ffoursquare_type;
    property google_place_id: String read Fgoogle_place_id
      write Fgoogle_place_id;
    property google_place_type: String read Fgoogle_place_type
      write Fgoogle_place_type;
  end;

  TTelegramWebAppData = class
  private
    Fdata: String;
    Fbutton_text: String;
  public
    property data: String read Fdata write Fdata;
    property button_text: String read Fbutton_text write Fbutton_text;
  end;

  TTelegramProximityAlertTriggered = class
  private
    Ftraveler: TTelegramUser;
    Fwatcher: TTelegramUser;
    Fdistance: Integer;
  public
    property traveler: TTelegramUser read Ftraveler write Ftraveler;
    property watcher: TTelegramUser read Fwatcher write Fwatcher;
    property distance: Integer read Fdistance write Fdistance;
  end;

  TTelegramMessageAutoDeleteTimerChanged = class
  private
    Fmessage_auto_delete_time: Integer;
  public
    property message_auto_delete_time: Integer read Fmessage_auto_delete_time
      write Fmessage_auto_delete_time;
  end;

  TTelegramForumTopicCreated = class
  private
    Fname: String;
    Ficon_color: Integer;
    Ficon_custom_emoji_id: String;
  public
    property name: String read Fname write Fname;
    property icon_color: Integer read Ficon_color write Ficon_color;
    property icon_custom_emoji_id: String read Ficon_custom_emoji_id
      write Ficon_custom_emoji_id;
  end;

  TTelegramForumTopicClosed = class
  end;

  TTelegramForumTopicEdited = class
  private
    Fname: String;
    Ficon_custom_emoji_id: String;
  public
    property name: String read Fname write Fname;
    property icon_custom_emoji_id: String read Ficon_custom_emoji_id
      write Ficon_custom_emoji_id;
  end;

  TTelegramForumTopicReopened = class
  end;

  TTelegramGeneralForumTopicHidden = class
  end;

  TTelegramGeneralForumTopicUnhidden = class
  end;

  TTelegramUserShared = class
  private
    Frequest_id: Integer;
    Fuser_id: Integer;
  public
    property request_id: Integer read Frequest_id write Frequest_id;
    property user_id: Integer read Fuser_id write Fuser_id;
  end;

  TTelegramChatShared = class
  private
    Frequest_id: Integer;
    Fchat_id: Integer;
  public
    property request_id: Integer read Frequest_id write Frequest_id;
    property chat_id: Integer read Fchat_id write Fchat_id;
  end;

  TTelegramWriteAccessAllowed = class
  private
    Fweb_app_name: String;
  public
    property web_app_name: String read Fweb_app_name write Fweb_app_name;
  end;

  TTelegramVideoChatScheduled = class
  private
    Fstart_date: Integer;
  public
    property start_date: Integer read Fstart_date write Fstart_date;
  end;

  TTelegramVideoChatStarted = class
  end;

  TTelegramVideoChatEnded = class
  private
    Fduration: Integer;
  public
    property duration: Integer read Fduration write Fduration;
  end;

  TTelegramVideoChatParticipantsInvited = class
  private
    Fusers: TArray<TTelegramUser>;
  public
    property users: TArray<TTelegramUser> read Fusers write Fusers;
  end;

  TTelegramUserProfilePhotos = class
  private
    Ftotal_count: Integer;
    Fphotos: TArray<TArray<TTelegramPhotoSize>>;
  public
    property total_count: Integer read Ftotal_count write Ftotal_count;
    property photos: TArray < TArray < TTelegramPhotoSize >> read Fphotos
      write Fphotos;
  end;

  TTelegramFile = class
  private
    Ffile_id: String;
    Ffile_unique_id: String;
    Ffile_size: Integer;
    Ffile_path: String;
  public
    property file_id: String read Ffile_id write Ffile_id;
    property file_unique_id: String read Ffile_unique_id write Ffile_unique_id;
    property file_size: Integer read Ffile_size write Ffile_size;
    property file_path: String read Ffile_path write Ffile_path;
  end;

  TTelegramWebAppInfo = class
  private
    Furl: String;
  public
    property url: String read Furl write Furl;
  end;

  TTelegramReplyKeyboardMarkup = class
  private
    Fkeyboard: TArray<TArray<TTelegramKeyboardButton>>;
    Fis_persistent: Boolean;
    Fresize_keyboard: Boolean;
    Fone_time_keyboard: Boolean;
    Finput_field_placeholder: String;
    Fselective: Boolean;
  public
    property keyboard: TArray < TArray < TTelegramKeyboardButton >>
      read Fkeyboard write Fkeyboard;
    property is_persistent: Boolean read Fis_persistent write Fis_persistent;
    property resize_keyboard: Boolean read Fresize_keyboard
      write Fresize_keyboard;
    property one_time_keyboard: Boolean read Fone_time_keyboard
      write Fone_time_keyboard;
    property input_field_placeholder: String read Finput_field_placeholder
      write Finput_field_placeholder;
    property selective: Boolean read Fselective write Fselective;
  end;

  TTelegramKeyboardButton = class
  private
    Ftext: string;
    Frequest_user: TTelegramKeyboardButtonRequestUser;
    Frequest_chat: TTelegramKeyboardButtonRequestChat;
    Frequest_contact: Boolean;
    Frequest_location: Boolean;
    Frequest_poll: TTelegramKeyboardButtonPollType;
    Fweb_app: TTelegramWebAppInfo;
  public
    property text: string read Ftext write Ftext;
    property request_user: TTelegramKeyboardButtonRequestUser read Frequest_user
      write Frequest_user;
    property request_chat: TTelegramKeyboardButtonRequestChat read Frequest_chat
      write Frequest_chat;
    property request_contact: Boolean read Frequest_contact
      write Frequest_contact;
    property request_location: Boolean read Frequest_location
      write Frequest_location;
    property request_poll: TTelegramKeyboardButtonPollType read Frequest_poll
      write Frequest_poll;
    property web_app: TTelegramWebAppInfo read Fweb_app write Fweb_app;
  end;

  TTelegramKeyboardButtonRequestUser = class
  private
    Frequest_id: Int32;
    Fuser_is_bot: Boolean;
    Fuser_is_premium: Boolean;
  public
    property request_id: Int32 read Frequest_id write Frequest_id;
    property user_is_bot: Boolean read Fuser_is_bot write Fuser_is_bot;
    property user_is_premium: Boolean read Fuser_is_premium
      write Fuser_is_premium;
  end;

  TTelegramKeyboardButtonRequestChat = class
  private
    Frequest_id: Int32;
    Fchat_is_channel: Boolean;
    Fchat_is_forum: Boolean;
    Fchat_has_username: Boolean;
    Fchat_is_created: Boolean;
    Fbot_is_member: Boolean;
  public
    property request_id: Int32 read Frequest_id write Frequest_id;
    property chat_is_channel: Boolean read Fchat_is_channel
      write Fchat_is_channel;
    property chat_is_forum: Boolean read Fchat_is_forum write Fchat_is_forum;
    property chat_has_username: Boolean read Fchat_has_username
      write Fchat_has_username;
    property chat_is_created: Boolean read Fchat_is_created
      write Fchat_is_created;
    property bot_is_member: Boolean read Fbot_is_member write Fbot_is_member;
  end;

  TTelegramKeyboardButtonPollType = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramReplyKeyboardRemove = class
  private
    Fremove_keyboard: Boolean;
    Fselective: Boolean;
  public
    property remove_keyboard: Boolean read Fremove_keyboard
      write Fremove_keyboard;
    property selective: Boolean read Fselective write Fselective;
  end;

  TTelegramInlineKeyboardMarkup = class
  private
    Finline_keyboard: TArray<TArray<TTelegramInlineKeyboardButton>>;
  public
    property inline_keyboard: TArray <TArray<TTelegramInlineKeyboardButton>>
      read Finline_keyboard write Finline_keyboard;
  end;

  TTelegramInlineKeyboardButton = class
  private
    Ftext: string;
    Furl: string;
    Fcallback_data: string;
    Fweb_app: TTelegramWebAppInfo;
    Flogin_url: TTelegramLoginUrl;
    Fswitch_inline_query: string;
    Fswitch_inline_query_current_chat: string;
    Fswitch_inline_query_chosen_chat: TTelegramSwitchInlineQueryChosenChat;
    Fpay: Boolean;
  public
    property text: string read Ftext write Ftext;
    property url: string read Furl write Furl;
    property callback_data: string read Fcallback_data write Fcallback_data;
    property web_app: TTelegramWebAppInfo read Fweb_app write Fweb_app;
    property login_url: TTelegramLoginUrl read Flogin_url write Flogin_url;
    property switch_inline_query: string read Fswitch_inline_query write Fswitch_inline_query;
    property switch_inline_query_current_chat: string read Fswitch_inline_query_current_chat write Fswitch_inline_query_current_chat;
    property switch_inline_query_chosen_chat: TTelegramSwitchInlineQueryChosenChat read Fswitch_inline_query_chosen_chat write Fswitch_inline_query_chosen_chat;
    property pay: Boolean read Fpay write Fpay;
  end;

  TTelegramLoginUrl = class
  private
    Furl: string;
    Fforward_text: string;
    Fbot_username: string;
    Frequest_write_access: Boolean;
  public
    property url: string read Furl write Furl;
    property forward_text: string read Fforward_text write Fforward_text;
    property bot_username: string read Fbot_username write Fbot_username;
    property request_write_access: Boolean read Frequest_write_access write Frequest_write_access;
  end;

  TTelegramSwitchInlineQueryChosenChat = class
  private
    Fquery: string;
    Fallow_user_chats: Boolean;
    Fallow_bot_chats: Boolean;
    Fallow_group_chats: Boolean;
    Fallow_channel_chats: Boolean;
  public
    property query: string read Fquery write Fquery;
    property allow_user_chats: Boolean read Fallow_user_chats
      write Fallow_user_chats;
    property allow_bot_chats: Boolean read Fallow_bot_chats
      write Fallow_bot_chats;
    property allow_group_chats: Boolean read Fallow_group_chats
      write Fallow_group_chats;
    property allow_channel_chats: Boolean read Fallow_channel_chats
      write Fallow_channel_chats;
  end;

  TTelegramCallbackQuery = class
  private
    Fid: string;
    Ffrom: TTelegramUser;
    Fmessage: TTelegramMessage;
    Finline_message_id: string;
    Fchat_instance: string;
    Fdata: string;
    Fgame_short_name: string;
  public
    property id: string read Fid write Fid;
    property &from: TTelegramUser read Ffrom write Ffrom;
    property &message: TTelegramMessage read Fmessage write Fmessage;
    property inline_message_id: string read Finline_message_id
      write Finline_message_id;
    property chat_instance: string read Fchat_instance write Fchat_instance;
    property data: string read Fdata write Fdata;
    property game_short_name: string read Fgame_short_name write Fgame_short_name;
  end;

  TForceReply = class
  private
    Fforce_reply: Boolean;
    Finput_field_placeholder: string;
    Fselective: Boolean;
  public
    property force_reply: Boolean read Fforce_reply write Fforce_reply;
    property input_field_placeholder: string read Finput_field_placeholder
      write Finput_field_placeholder;
    property selective: Boolean read Fselective write Fselective;
  end;

  TTelegramForceReply = class
  private
    Fforce_reply: Boolean;
    Finput_field_placeholder: string;
    Fselective: Boolean;
  public
    property force_reply: Boolean read Fforce_reply write Fforce_reply;
    property input_field_placeholder: string read Finput_field_placeholder
      write Finput_field_placeholder;
    property selective: Boolean read Fselective write Fselective;
  end;

  TTelegramChatPhoto = class
  private
    Fsmall_file_id: string;
    Fsmall_file_unique_id: string;
    Fbig_file_id: string;
    Fbig_file_unique_id: string;
  public
    property small_file_id: string read Fsmall_file_id write Fsmall_file_id;
    property small_file_unique_id: string read Fsmall_file_unique_id
      write Fsmall_file_unique_id;
    property big_file_id: string read Fbig_file_id write Fbig_file_id;
    property big_file_unique_id: string read Fbig_file_unique_id
      write Fbig_file_unique_id;
  end;

  TTelegramChatInviteLink = class
  private
    Finvite_link: string;
    Fcreator: TTelegramUser;
    Fcreates_join_request: Boolean;
    Fis_primary: Boolean;
    Fis_revoked: Boolean;
    Fname: string;
    Fexpire_date: Integer;
    Fmember_limit: Integer;
    Fpending_join_request_count: Integer;
  public
    property invite_link: string read Finvite_link write Finvite_link;
    property creator: TTelegramUser read Fcreator write Fcreator;
    property creates_join_request: Boolean read Fcreates_join_request
      write Fcreates_join_request;
    property is_primary: Boolean read Fis_primary write Fis_primary;
    property is_revoked: Boolean read Fis_revoked write Fis_revoked;
    property name: string read Fname write Fname;
    property expire_date: Integer read Fexpire_date write Fexpire_date;
    property member_limit: Integer read Fmember_limit write Fmember_limit;
    property pending_join_request_count: Integer
      read Fpending_join_request_count write Fpending_join_request_count;
  end;

  TTelegramChatAdministratorRights = class
  private
    Fis_anonymous: Boolean;
    Fcan_manage_chat: Boolean;
    Fcan_delete_messages: Boolean;
    Fcan_manage_video_chats: Boolean;
    Fcan_restrict_members: Boolean;
    Fcan_promote_members: Boolean;
    Fcan_change_info: Boolean;
    Fcan_invite_users: Boolean;
    Fcan_post_messages: Boolean;
    Fcan_edit_messages: Boolean;
    Fcan_pin_messages: Boolean;
    Fcan_manage_topics: Boolean;
  public
    property is_anonymous: Boolean read Fis_anonymous write Fis_anonymous;
    property can_manage_chat: Boolean read Fcan_manage_chat
      write Fcan_manage_chat;
    property can_delete_messages: Boolean read Fcan_delete_messages
      write Fcan_delete_messages;
    property can_manage_video_chats: Boolean read Fcan_manage_video_chats
      write Fcan_manage_video_chats;
    property can_restrict_members: Boolean read Fcan_restrict_members
      write Fcan_restrict_members;
    property can_promote_members: Boolean read Fcan_promote_members
      write Fcan_promote_members;
    property can_change_info: Boolean read Fcan_change_info
      write Fcan_change_info;
    property can_invite_users: Boolean read Fcan_invite_users
      write Fcan_invite_users;
    property can_post_messages: Boolean read Fcan_post_messages
      write Fcan_post_messages;
    property can_edit_messages: Boolean read Fcan_edit_messages
      write Fcan_edit_messages;
    property can_pin_messages: Boolean read Fcan_pin_messages
      write Fcan_pin_messages;
    property can_manage_topics: Boolean read Fcan_manage_topics
      write Fcan_manage_topics;
  end;

  TTelegramChatMemberOwner = class
  private
    Fstatus: string;
    Fuser: TTelegramUser;
    Fis_anonymous: Boolean;
    Fcustom_title: string;
  public
    property status: string read Fstatus write Fstatus;
    property user: TTelegramUser read Fuser write Fuser;
    property is_anonymous: Boolean read Fis_anonymous write Fis_anonymous;
    property custom_title: string read Fcustom_title write Fcustom_title;
  end;

  TTelegramChatMemberAdministrator = class
  private
    Fstatus: string;
    Fuser: TTelegramUser;
    Fcan_be_edited: Boolean;
    Fis_anonymous: Boolean;
    Fcan_manage_chat: Boolean;
    Fcan_delete_messages: Boolean;
    Fcan_manage_video_chats: Boolean;
    Fcan_restrict_members: Boolean;
    Fcan_promote_members: Boolean;
    Fcan_change_info: Boolean;
    Fcan_invite_users: Boolean;
    Fcan_post_messages: Boolean;
    Fcan_edit_messages: Boolean;
    Fcan_pin_messages: Boolean;
    Fcan_manage_topics: Boolean;
    Fcustom_title: string;
  public
    property status: string read Fstatus write Fstatus;
    property user: TTelegramUser read Fuser write Fuser;
    property can_be_edited: Boolean read Fcan_be_edited write Fcan_be_edited;
    property is_anonymous: Boolean read Fis_anonymous write Fis_anonymous;
    property can_manage_chat: Boolean read Fcan_manage_chat
      write Fcan_manage_chat;
    property can_delete_messages: Boolean read Fcan_delete_messages
      write Fcan_delete_messages;
    property can_manage_video_chats: Boolean read Fcan_manage_video_chats
      write Fcan_manage_video_chats;
    property can_restrict_members: Boolean read Fcan_restrict_members
      write Fcan_restrict_members;
    property can_promote_members: Boolean read Fcan_promote_members
      write Fcan_promote_members;
    property can_change_info: Boolean read Fcan_change_info
      write Fcan_change_info;
    property can_invite_users: Boolean read Fcan_invite_users
      write Fcan_invite_users;
    property can_post_messages: Boolean read Fcan_post_messages
      write Fcan_post_messages;
    property can_edit_messages: Boolean read Fcan_edit_messages
      write Fcan_edit_messages;
    property can_pin_messages: Boolean read Fcan_pin_messages
      write Fcan_pin_messages;
    property can_manage_topics: Boolean read Fcan_manage_topics
      write Fcan_manage_topics;
    property custom_title: string read Fcustom_title write Fcustom_title;
  end;

  TTelegramChatMemberMember = class
  private
    Fstatus: string;
    Fuser: TTelegramUser;
  public
    property status: string read Fstatus write Fstatus;
    property user: TTelegramUser read Fuser write Fuser;
  end;

  TTelegramChatMemberRestricted = class
  private
    Fstatus: string;
    Fuser: TTelegramUser;
    Fis_member: Boolean;
    Fcan_send_messages: Boolean;
    Fcan_send_audios: Boolean;
    Fcan_send_documents: Boolean;
    Fcan_send_photos: Boolean;
    Fcan_send_videos: Boolean;
    Fcan_send_video_notes: Boolean;
    Fcan_send_voice_notes: Boolean;
    Fcan_send_polls: Boolean;
    Fcan_send_other_messages: Boolean;
    Fcan_add_web_page_previews: Boolean;
    Fcan_change_info: Boolean;
    Fcan_invite_users: Boolean;
    Fcan_pin_messages: Boolean;
    Fcan_manage_topics: Boolean;
    Funtil_date: Integer;
  public
    property status: string read Fstatus write Fstatus;
    property user: TTelegramUser read Fuser write Fuser;
    property is_member: Boolean read Fis_member write Fis_member;
    property can_send_messages: Boolean read Fcan_send_messages
      write Fcan_send_messages;
    property can_send_audios: Boolean read Fcan_send_audios
      write Fcan_send_audios;
    property can_send_documents: Boolean read Fcan_send_documents
      write Fcan_send_documents;
    property can_send_photos: Boolean read Fcan_send_photos
      write Fcan_send_photos;
    property can_send_videos: Boolean read Fcan_send_videos
      write Fcan_send_videos;
    property can_send_video_notes: Boolean read Fcan_send_video_notes
      write Fcan_send_video_notes;
    property can_send_voice_notes: Boolean read Fcan_send_voice_notes
      write Fcan_send_voice_notes;
    property can_send_polls: Boolean read Fcan_send_polls write Fcan_send_polls;
    property can_send_other_messages: Boolean read Fcan_send_other_messages
      write Fcan_send_other_messages;
    property can_add_web_page_previews: Boolean read Fcan_add_web_page_previews
      write Fcan_add_web_page_previews;
    property can_change_info: Boolean read Fcan_change_info
      write Fcan_change_info;
    property can_invite_users: Boolean read Fcan_invite_users
      write Fcan_invite_users;
    property can_pin_messages: Boolean read Fcan_pin_messages
      write Fcan_pin_messages;
    property can_manage_topics: Boolean read Fcan_manage_topics
      write Fcan_manage_topics;
    property until_date: Integer read Funtil_date write Funtil_date;
  end;

  TTelegramChatMemberLeft = class
  private
    Fstatus: string;
    Fuser: TTelegramUser;
  public
    property status: string read Fstatus write Fstatus;
    property user: TTelegramUser read Fuser write Fuser;
  end;

  TTelegramChatMemberBanned = class
  private
    Fstatus: string;
    Fuser: TTelegramUser;
    Funtil_date: Int64;
  public
    property status: string read Fstatus write Fstatus;
    property user: TTelegramUser read Fuser write Fuser;
    property until_date: Int64 read Funtil_date write Funtil_date;
  end;

  TTelegramChatMemberUpdated = class
  private
    Fchat: TTelegramChat;
    Ffrom: TTelegramUser;
    Fdate: Integer;
    Finvite_link: TTelegramChatInviteLink;
    Fvia_chat_folder_invite_link: Boolean;
  public
    property chat: TTelegramChat read Fchat write Fchat;
    property from: TTelegramUser read Ffrom write Ffrom;
    property date: Integer read Fdate write Fdate;
    property invite_link: TTelegramChatInviteLink read Finvite_link
      write Finvite_link;
    property via_chat_folder_invite_link: Boolean
      read Fvia_chat_folder_invite_link write Fvia_chat_folder_invite_link;
  end;

  TTelegramChatJoinRequest = class
  private
    Fchat: TTelegramChat;
    Ffrom: TTelegramUser;
    Fuser_chat_id: Int64;
    Fdate: Integer;
    Fbio: string;
    Finvite_link: TTelegramChatInviteLink;
  public
    property chat: TTelegramChat read Fchat write Fchat;
    property from: TTelegramUser read Ffrom write Ffrom;
    property user_chat_id: Int64 read Fuser_chat_id write Fuser_chat_id;
    property date: Integer read Fdate write Fdate;
    property bio: string read Fbio write Fbio;
    property invite_link: TTelegramChatInviteLink read Finvite_link
      write Finvite_link;
  end;

  TTelegramChatPermissions = class
  private
    Fcan_send_messages: Boolean;
    Fcan_send_audios: Boolean;
    Fcan_send_documents: Boolean;
    Fcan_send_photos: Boolean;
    Fcan_send_videos: Boolean;
    Fcan_send_video_notes: Boolean;
    Fcan_send_voice_notes: Boolean;
    Fcan_send_polls: Boolean;
    Fcan_send_other_messages: Boolean;
    Fcan_add_web_page_previews: Boolean;
    Fcan_change_info: Boolean;
    Fcan_invite_users: Boolean;
    Fcan_pin_messages: Boolean;
    Fcan_manage_topics: Boolean;
  public
    property can_send_messages: Boolean read Fcan_send_messages
      write Fcan_send_messages;
    property can_send_audios: Boolean read Fcan_send_audios
      write Fcan_send_audios;
    property can_send_documents: Boolean read Fcan_send_documents
      write Fcan_send_documents;
    property can_send_photos: Boolean read Fcan_send_photos
      write Fcan_send_photos;
    property can_send_videos: Boolean read Fcan_send_videos
      write Fcan_send_videos;
    property can_send_video_notes: Boolean read Fcan_send_video_notes
      write Fcan_send_video_notes;
    property can_send_voice_notes: Boolean read Fcan_send_voice_notes
      write Fcan_send_voice_notes;
    property can_send_polls: Boolean read Fcan_send_polls write Fcan_send_polls;
    property can_send_other_messages: Boolean read Fcan_send_other_messages
      write Fcan_send_other_messages;
    property can_add_web_page_previews: Boolean read Fcan_add_web_page_previews
      write Fcan_add_web_page_previews;
    property can_change_info: Boolean read Fcan_change_info
      write Fcan_change_info;
    property can_invite_users: Boolean read Fcan_invite_users
      write Fcan_invite_users;
    property can_pin_messages: Boolean read Fcan_pin_messages
      write Fcan_pin_messages;
    property can_manage_topics: Boolean read Fcan_manage_topics
      write Fcan_manage_topics;
  end;

  TTelegramChatLocation = class
  private
    Flocation: TTelegramLocation;
    Faddress: string;
  public
    property location: TTelegramLocation read Flocation write Flocation;
    property address: string read Faddress write Faddress;
  end;

  TTelegramForumTopic = class
  private
    Fmessage_thread_id: Integer;
    Fname: string;
    Ficon_color: Integer;
    Ficon_custom_emoji_id: string;
  public
    property message_thread_id: Integer read Fmessage_thread_id
      write Fmessage_thread_id;
    property name: string read Fname write Fname;
    property icon_color: Integer read Ficon_color write Ficon_color;
    property icon_custom_emoji_id: string read Ficon_custom_emoji_id
      write Ficon_custom_emoji_id;
  end;

  TTelegramBotCommand = class
  private
    Fcommand: string;
    Fdescription: string;
  public
    property command: string read Fcommand write Fcommand;
    property description: string read Fdescription write Fdescription;
  end;

  TTelegramBotCommandScopeDefault = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramBotCommandScopeAllPrivateChats = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramBotCommandScopeAllGroupChats = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramBotCommandScopeAllChatAdministrators = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramBotCommandScopeChat = class
  private
    Ftype: string;
    Fchat_id: Variant;
  public
    property &type: string read Ftype write Ftype;
    property chat_id: Variant read Fchat_id write Fchat_id;
  end;

  TTelegramBotCommandScopeChatAdministrators = class
  private
    Ftype: string;
    Fchat_id: Variant;
  public
    property &type: string read Ftype write Ftype;
    property chat_id: Variant read Fchat_id write Fchat_id;
  end;

  TTelegramBotCommandScopeChatMember = class
  private
    Ftype: string;
    Fchat_id: Variant;
    Fuser_id: Integer;
  public
    property &type: string read Ftype write Ftype;
    property chat_id: Variant read Fchat_id write Fchat_id;
    property user_id: Integer read Fuser_id write Fuser_id;
  end;

  TTelegramBotName = class
  private
    Fname: string;
  public
    property name: string read Fname write Fname;
  end;

  TTelegramBotShortDescription = class
  private
    Fshort_description: string;
  public
    property short_description: string read Fshort_description
      write Fshort_description;
  end;

  TTelegramMenuButtonCommands = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramMenuButtonWebApp = class
  private
    Ftype: string;
    Ftext: string;
    Fweb_app: TTelegramWebAppInfo;
  public
    property &type: string read Ftype write Ftype;
    property text: string read Ftext write Ftext;
    property web_app: TTelegramWebAppInfo read Fweb_app write Fweb_app;
  end;

  TTelegramMenuButtonDefault = class
  private
    Ftype: string;
  public
    property &type: string read Ftype write Ftype;
  end;

  TTelegramResponseParameters = class
  private
    Fmigrate_to_chat_id: Int64;
    Fretry_after: Integer;
  public
    property migrate_to_chat_id: Int64 read Fmigrate_to_chat_id
      write Fmigrate_to_chat_id;
    property retry_after: Integer read Fretry_after write Fretry_after;
  end;

  TTelegramInputMediaPhoto = class
  private
    Ftype: string;
    Fmedia: string;
    Fcaption: string;
    Fparse_mode: string;
    Fcaption_entities: TArray<TTelegramMessageEntity>;
    Fhas_spoiler: Boolean;
  public
    property &type: string read Ftype write Ftype;
    property media: string read Fmedia write Fmedia;
    property caption: string read Fcaption write Fcaption;
    property parse_mode: string read Fparse_mode write Fparse_mode;
    property caption_entities: TArray<TTelegramMessageEntity>
      read Fcaption_entities write Fcaption_entities;
    property has_spoiler: Boolean read Fhas_spoiler write Fhas_spoiler;
  end;

  TTelegramInputMediaVideo = class
  private
    Ftype: string;
    Fmedia: string;
    Fthumbnail: string; // also InputFile
    Fcaption: string;
    Fparse_mode: string;
    Fcaption_entities: TArray<TTelegramMessageEntity>;
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
    Fsupports_streaming: Boolean;
    Fhas_spoiler: Boolean;
  public
    property &type: string read Ftype write Ftype;
    property media: string read Fmedia write Fmedia;
    property thumbnail: string read Fthumbnail write Fthumbnail;
    property caption: string read Fcaption write Fcaption;
    property parse_mode: string read Fparse_mode write Fparse_mode;
    property caption_entities: TArray<TTelegramMessageEntity>
      read Fcaption_entities write Fcaption_entities;
    property width: Integer read Fwidth write Fwidth;
    property height: Integer read Fheight write Fheight;
    property duration: Integer read Fduration write Fduration;
    property supports_streaming: Boolean read Fsupports_streaming
      write Fsupports_streaming;
    property has_spoiler: Boolean read Fhas_spoiler write Fhas_spoiler;
  end;

  TTelegramInputMediaAnimation = class
  private
    Ftype: string;
    Fmedia: string;
    Fthumbnail: string;
    Fcaption: string;
    Fparse_mode: string;
    Fcaption_entities: TArray<TTelegramMessageEntity>;
    Fwidth: Integer;
    Fheight: Integer;
    Fduration: Integer;
    Fhas_spoiler: Boolean;
  public
    property &type: string read Ftype write Ftype;
    property media: string read Fmedia write Fmedia;
    property thumbnail: string read Fthumbnail write Fthumbnail;
    property caption: string read Fcaption write Fcaption;
    property parse_mode: string read Fparse_mode write Fparse_mode;
    property caption_entities: TArray<TTelegramMessageEntity>
      read Fcaption_entities write Fcaption_entities;
    property width: Integer read Fwidth write Fwidth;
    property height: Integer read Fheight write Fheight;
    property duration: Integer read Fduration write Fduration;
    property has_spoiler: Boolean read Fhas_spoiler write Fhas_spoiler;
  end;

  TTelegramInputMediaAudio = class
  private
    Ftype: string;
    Fmedia: string;
    Fthumbnail: string;
    Fcaption: string;
    Fparse_mode: string;
    Fcaption_entities: TArray<TTelegramMessageEntity>;
    Fduration: Integer;
    Fperformer: string;
    Ftitle: string;
  public
    property &type: string read Ftype write Ftype;
    property media: string read Fmedia write Fmedia;
    property thumbnail: string read Fthumbnail write Fthumbnail;
    property caption: string read Fcaption write Fcaption;
    property parse_mode: string read Fparse_mode write Fparse_mode;
    property caption_entities: TArray<TTelegramMessageEntity>
      read Fcaption_entities write Fcaption_entities;
    property duration: Integer read Fduration write Fduration;
    property performer: string read Fperformer write Fperformer;
    property title: string read Ftitle write Ftitle;
  end;

  TTelegramInputMediaDocument = class
  private
    Ftype: string;
    Fmedia: string;
    Fthumbnail: string;
    Fcaption: string;
    Fparse_mode: string;
    Fcaption_entities: TArray<TTelegramMessageEntity>;
    Fdisable_content_type_detection: Boolean;
  public
    property &type: string read Ftype write Ftype;
    property media: string read Fmedia write Fmedia;
    property thumbnail: string read Fthumbnail write Fthumbnail;
    property caption: string read Fcaption write Fcaption;
    property parse_mode: string read Fparse_mode write Fparse_mode;
    property caption_entities: TArray<TTelegramMessageEntity> read Fcaption_entities write Fcaption_entities;
    property disable_content_type_detection: Boolean read Fdisable_content_type_detection write Fdisable_content_type_detection;
  end;

  TTelegramUpdate = class
  private
    Fupdate_id: Integer;
    Fmessage: TTelegramMessage;
    Fedited_message: TTelegramMessage;
    Fchannel_post: TTelegramMessage;
    Fedited_channel_post: TTelegramMessage;
    Finline_query: TTelegramInlineQuery;
    Fchosen_inline_result: TTelegramChosenInlineResult;
    Fcallback_query: TTelegramCallbackQuery;
    Fshipping_query: TTelegramShippingQuery;
    Fpre_checkout_query: TTelegramPreCheckoutQuery;
    Fpoll: TTelegramPoll;
    Fpoll_answer: TTelegramPollAnswer;
    Fmy_chat_member: TTelegramChatMemberUpdated;
    Fchat_member: TTelegramChatMemberUpdated;
    Fchat_join_request: TTelegramChatJoinRequest;
  public
    property update_id: Integer read Fupdate_id write Fupdate_id;
    property &message: TTelegramMessage read Fmessage write Fmessage;
    property edited_message: TTelegramMessage read Fedited_message write Fedited_message;
    property channel_post: TTelegramMessage read Fchannel_post write Fchannel_post;
    property edited_channel_post: TTelegramMessage read Fedited_channel_post write Fedited_channel_post;
    property inline_query: TTelegramInlineQuery read Finline_query write Finline_query;
    property chosen_inline_result: TTelegramChosenInlineResult read Fchosen_inline_result write Fchosen_inline_result;
    property callback_query: TTelegramCallbackQuery read Fcallback_query write Fcallback_query;
    property shipping_query: TTelegramShippingQuery read Fshipping_query write Fshipping_query;
    property pre_checkout_query: TTelegramPreCheckoutQuery read Fpre_checkout_query write Fpre_checkout_query;
    property poll: TTelegramPoll read Fpoll write Fpoll;
    property poll_answer: TTelegramPollAnswer read Fpoll_answer write Fpoll_answer;
    property my_chat_member: TTelegramChatMemberUpdated read Fmy_chat_member write Fmy_chat_member;
    property chat_member: TTelegramChatMemberUpdated read Fchat_member write Fchat_member;
    property chat_join_request: TTelegramChatJoinRequest read Fchat_join_request write Fchat_join_request;
  end;


  TTelegramInlineQuery = class
  private
    Fid: string;
    Ffrom: TTelegramUser;
    Fquery: string;
    Foffset: string;
    Fchat_type: string;
    Flocation: TTelegramLocation;
  public
    property id: string read Fid write Fid;
    property from: TTelegramUser read Ffrom write Ffrom;
    property query: string read Fquery write Fquery;
    property offset: string read Foffset write Foffset;
    property chat_type: string read Fchat_type write Fchat_type;
    property location: TTelegramLocation read Flocation write Flocation;
  end;

  TTelegramChosenInlineResult = class
  private
    Fresult_id: string;
    Ffrom: TTelegramUser;
    Flocation: TTelegramLocation;
    Finline_message_id: string;
    Fquery: string;
  public
    property result_id: string read Fresult_id write Fresult_id;
    property from: TTelegramUser read Ffrom write Ffrom;
    property location: TTelegramLocation read Flocation write Flocation;
    property inline_message_id: string read Finline_message_id write Finline_message_id;
    property query: string read Fquery write Fquery;
  end;

  TTelegramShippingQuery  = class
  private
    Fid: string;
    Ffrom: TTelegramUser;
    Finvoice_payload: string;
    Fshipping_address: TTelegramShippingAddress;
  public
    property id: string read Fid write Fid;
    property from: TTelegramUser read Ffrom write Ffrom;
    property invoice_payload: string read Finvoice_payload write Finvoice_payload;
    property shipping_address: TTelegramShippingAddress read Fshipping_address write Fshipping_address;
  end;

  TTelegramShippingAddress = class
  private
    Fcountry_code: string;
    Fstate: string;
    Fcity: string;
    Fstreet_line1: string;
    Fstreet_line2: string;
    Fpost_code: string;
  public
    property country_code: string read Fcountry_code write Fcountry_code;
    property state: string read Fstate write Fstate;
    property city: string read Fcity write Fcity;
    property street_line1: string read Fstreet_line1 write Fstreet_line1;
    property street_line2: string read Fstreet_line2 write Fstreet_line2;
    property post_code: string read Fpost_code write Fpost_code;
  end;

  TTelegramPreCheckoutQuery = class
  private
    Fid: string;
    Ffrom: TTelegramUser;
    Fcurrency: string;
    Ftotal_amount: Integer;
    Finvoice_payload: string;
    Fshipping_option_id: string;
    Forder_info: TTelegramOrderInfo;
  public
    property id: string read Fid write Fid;
    property &from: TTelegramUser read Ffrom write Ffrom;
    property currency: string read Fcurrency write Fcurrency;
    property total_amount: Integer read Ftotal_amount write Ftotal_amount;
    property invoice_payload: string read Finvoice_payload write Finvoice_payload;
    property shipping_option_id: string read Fshipping_option_id write Fshipping_option_id;
    property order_info: TTelegramOrderInfo read Forder_info write Forder_info;
  end;

  TTelegramOrderInfo = class
  private
    Fname: string;
    Fphone_number: string;
    Femail: string;
    Fshipping_address: TTelegramShippingAddress;
  public
    property name: string read Fname write Fname;
    property phone_number: string read Fphone_number write Fphone_number;
    property email: string read Femail write Femail;
    property shipping_address: TTelegramShippingAddress read Fshipping_address write Fshipping_address;
  end;


  TTelegramUpdateArray = class (TObject)
    private
      Fok : Boolean;
      Fresult : TArray<TTelegramUpdate>;
    public
      property ok             : Boolean                   read Fok            write   Fok ;
      property result         : TArray<TTelegramUpdate>   read Fresult        write   Fresult;
  end;

 TArrayInKeyboards = TArray<TArray<TTelegramInlineKeyBoardButton>>;


implementation


{ TTelegramInlineKeyboardMarkup }


end.


