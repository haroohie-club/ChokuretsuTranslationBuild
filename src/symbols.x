main_2000C04 = 0x02000c04;
GX_SetGraphicsMode = 0x020025b8;
GX_VRAMCNT_SetLCDC_ = 0x020026c4;
GX_SetBankForBG = 0x0200277c;
GX_SetBankForOBJ = 0x02002a0c;
tex_allocAnimFrame = 0x02003ce8;
tex_allocBns = 0x02003d40;
tex_loadToVram = 0x020044d8;
OS_SetIrqFunction = 0x020047e0;
OS_EnableIrqMask = 0x02004924;
OS_DisableIrqMask = 0x02004954;
OS_ResetRequestIrqMask = 0x02004984;
OS_InitLock = 0x020049e4;
OS_GetLockID = 0x02004ce8;
OS_SleepThread = 0x02005368;
OS_WakeupThreadDirect = 0x02005420;
OS_GetConsoleType = 0x020057c0;
drain_write_buffer = 0x02005b04;
OS_Init = 0x02005b7c;
OS_InitArena = 0x02005bc4;
OS_InitArenaEx = 0x02005cc8;
OS_GetInitArenaHi = 0x02005d5c;
OS_GetInitArenaLo = 0x02005e40;
OS_SetArenaHi = 0x02005ee8;
OS_SetArenaLo = 0x02005efc;
tex_memoryAlloc = 0x02005ffc;
OS_GetDTCMAddress = 0x02006360;
OS_EnableProtectionUnit = 0x02006374;
OS_DisableProtectionUnit = 0x02006384;
OS_SetProtectionRegion1 = 0x020063a8;
OS_SetProtectionRegion2 = 0x020063b0;
OS_InitException = 0x020063b8;
OSi_ExceptionHandler = 0x0200644c;
OSi_GetAndDisplayContext = 0x020064ac;
OSi_SetExContext = 0x020064c0;
OSi_DisplayExContext = 0x02006550;
OS_DisableInterrupts = 0x02006c40;
OS_RestoreInterrupts = 0x02006c54;
countLeadingZeros = 0x02006d60;
MI_DmaFill32 = 0x02006e50;
MI_DmaCopy32 = 0x02006ed0;
MI_DmaCopy16 = 0x02006f40;
MI_StopDma = 0x02007170;
MIi_CheckDma0SourceAddress = 0x02007298;
memcpy2007314 = 0x02007314;
MIi_CpuClearFast = 0x0200738c;
memcpy20073E8 = 0x020073e8;
MIi_CardDmaCopy32 = 0x020076cc;
sound_20079A8 = 0x020079a8;
PXI_Init = 0x02008960;
FSi_ReleaseCommand = 0x02008c7c;
FSi_ExecuteSyncCommand = 0x02009b5c;
FSi_SendCommand = 0x02009ba0;
FS_InitArchive = 0x02009d44;
FS_RegisterArchiveName = 0x02009db0;
FS_LoadArchive = 0x02009e64;
FS_SetArchiveProc = 0x02009ff8;
FS_Init = 0x0200a09c;
FSi_ReadFileCore = 0x0200a230;
FS_WaitAsync = 0x0200a428;
FS_CancelFile = 0x0200a4e8;
FS_ReadFileAsync = 0x0200a530;
FS_ReadFile = 0x0200a540;
FSi_OnRomReadDone = 0x0200a5bc;
FSi_ReadRomCallback = 0x0200a5e0;
FSi_WriteDummyCallback = 0x0200a628;
FSi_RomArchiveProc = 0x0200a630;
FSi_EmptyArchiveProc = 0x0200a6a4;
FSi_InitRom = 0x0200a6ac;
FS_200AA88 = 0x0200aa88;
CARDi_SetRomOp = 0x0200e240;
CARDi_SetCardDma = 0x0200e2a0;
CARDi_OnReadCard = 0x0200e2f4;
CARDi_TryReadCardDma = 0x0200e3c4;
CARDi_ReadRom = 0x0200e734;
CARD_Init = 0x0200e82c;
printf = 0x0201147c;
dbg_VSPrintf = 0x02011ce4;
dbg_print2011D4C = 0x02011d4c;
dbg_sprintf = 0x02011d64;
strlen = 0x0201320c;
floatingPointGreaterThanEqual = 0x0201c300;
floatingPointLessThanEqual = 0x0201c420;
intToFloat = 0x0201ca08;
floatMult = 0x0201ca98;
fast_divide = 0x0201d104;
divideIfNotZero = 0x0201d310;
unhinged_file_length_routine = 0x0201d318;
mcard_OS_GetLockID = 0x0201f650;
mcard_initSave = 0x0201f6b4;
game_loadSdat = 0x0201ff08;
findSndIndexInBank = 0x020203e0;
snd_fadeOut = 0x020205e0;
snd_playInternal = 0x0202066c;
scene_getDialog = 0x02020838;
memcpy = 0x020208ac;
tex_allocSimpleCaller = 0x02020ab0;
tex_allocSimple = 0x02020ac4;
tex_allocGrpTexture = 0x02020cd8;
tex_allocTextTexture = 0x02020eb4;
tex_2020F14 = 0x02020f14;
tex_allocTextureCaller = 0x02021060;
tex_allocTexture = 0x02021078;
tex_20215D0 = 0x020215d0;
ds_tex_validate = 0x020216e4;
anim_demangleFrames = 0x0202171c;
ds_texTextTexture = 0x020219ac;
anim_rotatePalette = 0x02021c18;
anim_CAnimPrep = 0x02021f54;
anim_CAnimIterate = 0x02022098;
anim_CAnimWrite = 0x020222e8;
dbg_printError = 0x02022610;
throw_dialogueException = 0x020227d8;
dbg_print = 0x02022800;
dbg_print20228DC = 0x020228dc;
dsFileInit = 0x02022c08;
file_getGrpBinFile = 0x02022c64;
arc_loadAndSeek = 0x02022c94;
file_waitAsync = 0x02022d2c;
file_readAsync = 0x02022de4;
sys_swapScreens = 0x02022e38;
Rgb888ToRgb555 = 0x020239b0;
main_2023C70 = 0x02023c70;
scene_render2023EA4 = 0x02023ea4;
scene_render = 0x02023f50;
tex_memoryAllocCaller = 0x02024730;
tex_memoryAllocCallerCaller = 0x02024750;
arc_202477C = 0x0202477c;
string_store = 0x0202558c;
str_notEqual = 0x020255a8;
scene_20255CC = 0x020255cc;
str_substringNotEqual = 0x020255f8;
arr_length = 0x02025630;
rand_getSeed = 0x020258cc;
rand_getIntInRange = 0x02025924;
arc_init = 0x02025a84;
arc_copyFileTable = 0x02025aac;
arc_2025B08 = 0x02025b08;
shadeLibInit = 0x02025b18;
arc_decompress = 0x02026190;
sys_copyToOAM = 0x0202a848;
shdInit2 = 0x0202ab10;
save_calculateChecksum = 0x0202ad5c;
validateChecksum = 0x0202ad9c;
setFlagBitmask = 0x0202ae74;
save_load = 0x0202b47c;
save_writeCommon = 0x0202c5d8;
save_writeSlot = 0x0202ca10;
game_loadFontFile = 0x0202d260;
game_loadFontTable = 0x0202d320;
scene_renderDialogue = 0x0202d41c;
scene_renderDialogue202D9C4 = 0x0202d9c4;
scene_renderDialogue202DC3C = 0x0202dc3c;
intParse = 0x0202e0bc;
arc_copyFileToMemory = 0x0202e2e8;
dbg_memoryReport = 0x0202e38c;
grp_validateVramEnough = 0x0202e7dc;
dbg_vramReport = 0x0202e914;
sys_loadToOAM = 0x0202edb4;
sys_copyToOAMDirect = 0x0202efc4;
scene_getDialog202F258 = 0x0202f258;
font_getCharHash = 0x0202f26c;
font_hashChar = 0x0202f2c0;
FS_LoadOverlay = 0x0202f690;
grp_writeColorToBgPaletteVram = 0x0202f6cc;
isEventFlagSet = 0x0202f6f4;
evt_setEventFlag = 0x0202f728;
evt_clearEventFlag = 0x0202f760;
isFlagSet = 0x0202f79c;
setPermaFlag = 0x0202f7d0;
grp_tickAnimation = 0x02030ba4;
screenFadeColor = 0x02030d18;
screenFadeMonochrome = 0x02030f54;
event_addLineToBacklog = 0x020313f4;
evt_getBacklogLine = 0x020314e4;
evt_modifyFriendshipLevel = 0x020316e0;
setCgSeenFlag = 0x02032cb0;
arc_read = 0x02033798;
arc_fileTableLoad = 0x02033818;
arc_getNumFiles = 0x02033a58;
arc_pointerProcess = 0x02033a70;
string_findPeriod = 0x02033ac8;
file_findFileAndStripExtension = 0x02033b5c;
arc_readCompressedFile = 0x02033c7c;
arc_loadFile = 0x02033ed4;
arc_loadFileAndResolvePointers = 0x02033fc4;
arc_loadScriptFile = 0x02034000;
arc_loadFile2034014 = 0x02034014;
load_sysTexFromDat9B = 0x020341b0;
grp_loadSysTex = 0x020343ac;
grp_loadSysTexIndex = 0x02034440;
load_layout = 0x020345b0;
load_texcut = 0x020346cc;
load_texAnimData = 0x020347a8;
load_plt = 0x020348b0;
load_screen_bns = 0x02034998;
loadMapFile = 0x02034a5c;
load_palanm = 0x02034b94;
load_colanm = 0x02034d78;
load_sparkle = 0x02034f44;
arc_loadGraphicsFile203510C = 0x0203510c;
game_loadGlobalFiles = 0x02035138;
grp_prepSysTex = 0x02035a44;
grp_getSysTexEntry = 0x02035a94;
game_loadSoundFiles = 0x02035e1c;
snd_loadSound = 0x02035f90;
snd_stop = 0x02035fb4;
snd_play = 0x02035fc0;
dbg_printFree = 0x02036120;
dbg_printCriError = 0x02036134;
bgm_play = 0x0203614c;
bgm_determineVolume = 0x0203623c;
vce_play = 0x0203636c;
vce_determineVolume = 0x02036434;
vce_playRandomizedVoice = 0x020364c4;
grp_qmap = 0x020365c8;
evt_ParseConditional = 0x02038b44;
intParse2 = 0x02039230;
tex_allocDiffTextures = 0x020394e0;
snd_startFname = 0x0203cabc;
snd_setVolume = 0x0203cc04;
dbg_colonPrint = 0x0203ce48;
ACSSVR_Init_caller = 0x0204da08;
ACSSND_StartFname_callerCaller = 0x0204dacc;
ACSSND_StartFname_caller = 0x0204daf0;
ACSSND_SetOutVol_callerCaller = 0x0204db84;
ACSSND_SetOutVol_caller = 0x0204dba8;
ACSSVR_Init = 0x0204dd84;
ACSSVR_Finish = 0x0204de44;
ACSSVR_CreatSnd = 0x0204deec;
ACSSND_Create = 0x0204e3a4;
ACSSND_Init = 0x0204e400;
ACSSND_StartFname = 0x0204e7f8;
ACSSND_Stop = 0x0204e848;
ACSSND_GetStatPause = 0x0204e924;
ACSSND_GetStat = 0x0204e95c;
ACSSND_SetOutVol = 0x0204e9cc;
ACSSND_AttachAhx = 0x0204ea64;
ACSSND_GetAdxt = 0x0204eb0c;
ACSSND_GetNumAdxt = 0x0204eb70;
ACSSND_GetAixp = 0x0204eba8;
ACSSND_ApplyAllVol = 0x0204ec34;
ACSSND_Start = 0x0204edc8;
ACSFDR_Create = 0x0204f65c;
ACSSBADX_Create = 0x0204fe24;
ACSSBADX_CreateHndl = 0x0204fe80;
ACSVHL_Create = 0x0205009c;
ACSVHL_Init = 0x020500f8;
spr_findInBank = 0x0205092c;
spr_findInCache = 0x020509b0;
spr_loadLayoutTextures = 0x02050bf4;
spr_renderSprite = 0x02050d48;
evt_lipFlapSomething = 0x02051130;
evt_findStartingChibis = 0x02051260;
evt_executionEngine = 0x0205132c;
evt_setAndIncrementReadFlag = 0x02051870;
evt_getScriptSectionById = 0x020519d4;
evt_addLinesToBacklog = 0x02052190;
cmd_UNKNOWN00 = 0x02052250;
cmd_DIALOGUE = 0x0205229c;
cmd_KBG_DISP = 0x02052ca8;
cmd_PIN_MNL = 0x02052d90;
cmd_SCREEN_FADEIN = 0x02052e5c;
cmd_SCREEN_FADEOUT = 0x02052f9c;
cmd_SCREEN_FLASH = 0x020530d8;
cmd_SND_PLAY = 0x020531e0;
cmd_SND_STOP = 0x02053290;
cmd_BGM_PLAY = 0x020532b0;
cmd_VCE_PLAY = 0x02053468;
cmd_FLAG = 0x02053490;
cmd_TOPIC_GET = 0x020534c8;
cmd_TOGGLE_DIALOGUE = 0x02053554;
cmd_SELECT = 0x02053580;
cmd_SCREEN_SHAKE = 0x02053758;
cmd_SCREEN_SHAKE_STOP = 0x02053818;
cmd_GOTO = 0x02053884;
cmd_SCENE_GOTO = 0x0205390c;
cmd_WAIT = 0x020539d0;
cmd_HOLD = 0x02053a20;
cmd_NOOP1 = 0x02053a68;
cmd_VGOTO = 0x02053a70;
cmd_HARUHI_METER = 0x02053bc0;
cmd_HARUHI_METER_NOSHOW = 0x02053e3c;
cmd_PALEFFECT = 0x02053f7c;
cmd_BG_FADE = 0x020541e0;
cmd_TRANS_OUT = 0x02054714;
cmd_TRANS_IN = 0x020547ac;
cmd_SET_PLACE = 0x02054860;
cmd_ITEM_DISPIMG = 0x02054938;
cmd_SET_READ_FLAG = 0x02054a3c;
cmd_STOP = 0x02054abc;
cmd_NOOP3 = 0x02054afc;
cmd_LOAD_ISOMAP = 0x02054b14;
cmd_INVEST_START = 0x02054b6c;
cmd_INVEST_END = 0x02054be0;
cmd_CHIBI_EMOTE = 0x02054c44;
cmd_NEXT_SCENE = 0x02054c78;
cmd_SKIP_SCENE = 0x02054cd4;
cmd_MODIFY_FL = 0x02054d48;
cmd_CHIBI_ENTEREXIT = 0x02054d7c;
cmd_AVOID_DISP = 0x02054db4;
cmd_GLOBAL2D = 0x02054fa8;
cmd_CHESS_LOAD = 0x02054fd8;
cmd_CHESS_VGOTO = 0x02055034;
cmd_CHESS_MOVE = 0x02055160;
cmd_CHESS_TOGGLE_GUIDE = 0x020552bc;
cmd_CHESS_TOGGLE_HIGHLIGHT = 0x02055340;
cmd_CHESS_TOGGLE_CROSS = 0x020553f0;
cmd_CHESS_CLEAR_ANNOTATIONS = 0x020554a0;
cmd_SCENE_GOTO2 = 0x020554f4;
cmd_CHESS_RESET = 0x020555b0;
cmd_EPHEADER = 0x020555dc;
cmd_CONFETTI = 0x02055700;
cmd_BG_DISPCG = 0x02055810;
cmd_BG_SCROLL = 0x02055b50;
cmd_OP_MODE = 0x02055d84;
cmd_WAIT_CANCEL = 0x02055e78;
cmd_BG_REVERT = 0x02055eec;
cmd_BG_DISP = 0x0205602c;
evt_parseVariable = 0x02056238;
topic_getTopic = 0x020574e8;
topic_getById = 0x02057700;
topic_renderTopicSelection = 0x02058bf0;
topic_renderTopicTitle = 0x0205ae4c;
topic_tickerTapeLoad = 0x0205b7b4;
topic_loadSomething = 0x0205ba38;
scenario_processCommand = 0x0205bfc4;
unlockEndings = 0x0205c3f8;
dialog_handle = 0x0205c8c8;
scene_handleDialogOpCodes = 0x0205cad0;
evt_processStartingChibis = 0x0205eb68;
item_display = 0x02062720;
flag_setOrClear20C7090 = 0x02062cb0;
evt_processSomeSections = 0x0206461c;
evt_mapCharacterSelect = 0x020664dc;
evt_interactableObjectSelect = 0x02066674;
