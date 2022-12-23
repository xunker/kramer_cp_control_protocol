# VP-719 Command Reference
As a sanity check against [the original](https://cdn.kramerav.com/web/downloads/protocols/vp-719xl_720xl_vp-724xl_protocol.pdf)
Control Type | Function | Parameter (for Set) | Function Group | Function Description | Response Values | Comment
------------|--------|-------------------|--------------|--------------------|---------------|-------
0 | 0 | N/A | Remote Control Button | Output |  | 
0 | 1 | N/A | Remote Control Button | Freeze |  | 
0 | 2 | N/A | Remote Control Button | Power |  | 
0 | 3 | N/A | Remote Control Button | AV1 |  | 
0 | 4 | N/A | Remote Control Button | AV2 |  | 
0 | 5 | N/A | Remote Control Button | Comp |  | 
0 | 6 | N/A | Remote Control Button | YC1 |  | 
0 | 7 | N/A | Remote Control Button | YC2 |  | 
0 | 8 | N/A | Remote Control Button | VGA1 |  | 
0 | 9 | N/A | Remote Control Button | VGA2 |  | VP724 DS/XL Only
0 | 10 | N/A | Remote Control Button | DVI |  | 
0 | 11 | N/A | Remote Control Button | Information |  | 
0 | 12 | N/A | Remote Control Button | Area Left Up |  | 
0 | 13 | N/A | Remote Control Button | Area Middle Up |  | 
0 | 14 | N/A | Remote Control Button | Area Right Up |  | 
0 | 15 | N/A | Remote Control Button | Area Left Center |  | 
0 | 16 | N/A | Remote Control Button | Area Middle Center |  | 
0 | 17 | N/A | Remote Control Button | Area Right Center |  | 
0 | 18 | N/A | Remote Control Button | Area Left Down |  | 
0 | 19 | N/A | Remote Control Button | Area Middle Down |  | 
0 | 20 | N/A | Remote Control Button | Area Right Dow |  | 
0 | 21 | N/A | Remote Control Button | Auto Image |  | 
0 | 22 | N/A | Remote Control Button | Menu |  | 
0 | 23 | N/A | Remote Control Button | Up |  | 
0 | 24 | N/A | Remote Control Button | Left |  | 
0 | 25 | N/A | Remote Control Button | Enter |  | 
0 | 26 | N/A | Remote Control Button | Right |  | 
0 | 27 | N/A | Remote Control Button | Down |  | 
0 | 28 | N/A | Remote Control Button | Auto Gain |  | 
0 | 29 | N/A | Remote Control Button | PIP |  | 
0 | 30 | N/A | Remote Control Button | Swap |  | 
0 | 31 | N/A | Remote Control Button | Contrast |  | 
0 | 32 | N/A | Remote Control Button | Brightness |  | 
0 | 33 | N/A | Remote Control Button | Zoom In |  | 
0 | 34 | N/A | Remote Control Button | Zoom Out |  | 
0 | 35 | N/A | Remote Control Button | Volume Down |  | 
0 | 36 | N/A | Remote Control Button | Mute |  | 
0 | 37 | N/A | Remote Control Button | Volume Up |  | 
0 | 38 | N/A | Remote Control Button | Color Mode |  | 
0 | 39 | N/A | Remote Control Button | Aspect Ratio |  | 
1: Set, 2: Get | 0 | -10~10 | Gamma and Color | User1 Gamma |  | 
1: Set, 2: Get | 1 | 0~127 | Gamma and Color | User1 Color Temp Red |  | 
1: Set, 2: Get | 2 | 0~127 | Gamma and Color | User1 Color Temp Green |  | 
1: Set, 2: Get | 3 | 0~127 | Gamma and Color | User1 Color Temp Blue |  | 
1: Set, 2: Get | 4 | 0~32 | Gamma and Color | User1 Color Manager Red |  | 
1: Set, 2: Get | 5 | 0~32 | Gamma and Color | User1 Color Manager Green |  | 
1: Set, 2: Get | 6 | 0~32 | Gamma and Color | User1 Color Manager Blue |  | 
1: Set, 2: Get | 7 | 0~32 | Gamma and Color | User1 Color Manager Yellow |  | 
1: Set, 2: Get | 8 | -10~10 | Gamma and Color | User2 Gamma |  | 
1: Set, 2: Get | 9 | 0~127 | Gamma and Color | User2 Color Temp Red |  | 
1: Set, 2: Get | 10 | 0~127 | Gamma and Color | User2 Color Temp Green |  | 
1: Set, 2: Get | 11 | 0~127 | Gamma and Color | User2 Color Temp Blue |  | 
1: Set, 2: Get | 12 | 0~32 | Gamma and Color | User2 Color Manager Red |  | 
1: Set, 2: Get | 13 | 0~32 | Gamma and Color | User2 Color Manager Green |  | 
1: Set, 2: Get | 14 | 0~32 | Gamma and Color | User2 Color Manager Blue |  | 
1: Set, 2: Get | 15 | 0~32 | Gamma and Color | User2 Color Manager Yellow |  | 
1: Set, 2: Get | 16 | 0~127 |  | Brightness |  | 
1: Set, 2: Get | 17 | 0~127 |  | Contrast |  | 
1: Set, 2: Get | 18 | -32~32 | Aspect Ratio | User Define H-Zoom |  | 
1: Set, 2: Get | 19 | -32~32 | Aspect Ratio | User Define V-Zoom |  | 
1: Set, 2: Get | 20 | -32~32 | Aspect Ratio | User Define H-Pan |  | 
1: Set, 2: Get | 21 | -32~32 | Aspect Ratio | User Define V-Pan |  | 
1: Set, 2: Get | 22 | 0~255 | Graphics Setting | H-Position |  | 
1: Set, 2: Get | 23 | 0~255 | Graphics Setting | V-Position |  | 
1: Set, 2: Get | 24 | 0~127 | Graphics Setting | Color |  | 
1: Set, 2: Get | 25 | 0~127 | Graphics Setting | Hue |  | 
1: Set, 2: Get | 26 | 0~16 | Graphics Setting | Sharpness |  | 
1: Set, 2: Get | 27 | 0~100 | Graphics Setting | Frequency |  | 
1: Set, 2: Get | 28 | 0~31 | Graphics Setting | Phase |  | 
1: Set, 2: Get | 29 | 0~127 | Video Setting | Color |  | 
1: Set, 2: Get | 30 | 0~127 | Video Setting | Hue |  | 
1: Set, 2: Get | 31 | 0~16 | Video Setting | Sharpness |  | 
1: Set, 2: Get | 32 | 0~20 | Video Setting | H-Position |  | 
1: Set, 2: Get | 33 | 0~20 |  | Video V-Position for NTSC/NTSC 4.43/PAL-M/PAL 60 |  | Same function code as for PAL V-Position
1: Set, 2: Get | 33 | 0~39 |  | Video V-Position for PAL/PAL-N/SECAM/NTSC 4.43 50 |  | Same function code as for NTSC V-Position
1: Set, 2: Get | 34 | 0~32 | Audio Setting | Volume |  | 
1: Set, 2: Get | 35 | 0~12 | Audio Setting | Treble |  | 
1: Set, 2: Get | 36 | 0~12 | Audio Setting | Bass |  | 
1: Set, 2: Get | 37 | 0~36 | PIP Setting | H-Position |  | 
1: Set, 2: Get | 38 | 0~36 | PIP Setting | V-Position |  | 
1: Set, 2: Get | 39 | 0~255 | PIP Setting | User Define V-Size |  | 
1: Set, 2: Get | 40 | 0~255 | PIP Setting | User Define H-Size |  | 
1: Set, 2: Get | 41 | 0~36 | OSD Setting | H-Position |  | 
1: Set, 2: Get | 42 | 0~36 | OSD Setting | V-Position |  | 
1: Set, 2: Get | 43 | 3~60 | OSD Setting | OSD Time Out |  | 
1: Set, 2: Get | 44 | > 100 |  | HT, H-Sync Cycle |  | Setting Command should be a reasonable value)
1: Set, 2: Get | 45 | > 0 |  | HW, H-Sync Width |  | Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 46 | > 0 |  | HS, Active Pixel Start |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 47 | - |  | HA, Active Pixel |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 48 | 0~1 |  | HP, H-Sync Polarity (0 for positive polarity, 1 for negative polarity) |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 49 | > 0 |  | VT, V-Sync Cycle |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 50 | > 0 |  | VW, V-Sync Width |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 51 | > 0 |  | VS, Active Line Start |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 52 | - |  | VA, Active Line |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 53 | 0~1 |  | VA, Active Line (0 for positive polarity, 1 for negative polarity |  | 1. Setting Command should be a reasonable value 2. Getting Command return the current group parameter (refer to command "Y 3 29 X" or "Y 4 29 " )
1: Set, 2: Get | 54 | > 100 |  | OCLK |  | 1. Oclk = Param / 10 Mhz 2. Should be a reasonable value
3: Set, 4: Get | 0 | 0~9 |  | Select Input Source | 0: VGA-1, 1: VGA-2, 2: DVI, 3: Component, 4: YC-1, 5: AV-1, 6: YV-2, 7: AV-2, 8: Scart, 9: TV | VGA-2 is VP-724 Only
3: Set, 4: Get | 1 | 0~5 | Geometry | Video Aspect Ratio | 0: Normal, 1: Wide Screen, 2: Pan & Scan, 3: 4:3, 4: 16:9, 5: UserDefine | 
3: Set, 4: Get | 2 | 0~3 | Geometry | Video Nonlinear | 0: Off, 1: Side, 2: Middle | 
3: Set, 4: Get | 3 | 0~5 | Geometry | VGA Aspect Ratio | 0: Full Screen, 4: 16:9, 1: Native, 2: NonLinear, 3: 4:3, 5: UserDefine | 
3: Set, 4: Get | 4 | 0~10 | Zoom | Zoom Ratio | 0: 100%, 1: 150%, 2: 200%, 3: 225%, 4: 250%, 5: 275%, 6: 300%, 7: 325%, 8: 350%, 9: 375%, 10: 400%, 11: Custom | 
3: Set, 4: Get | 5 | 0~2 | Graphics Setting | Color Format | 0: Default, 1: RGB, 2: YUV | 
3: Set, 4: Get | 6 | 0~2 | Video Setting | Color Format | 0: Default, 1: RGB, 2: YUV | 
3: Set, 4: Get | 7 | 0~6 | Video Setting | Video Standard | 0: Video Standard - Auto, 1: Video Standard - NTSC, 2: Video Standard - NTSC 4.43, 3: Video Standard - PAL, 4: Video Standard - PAL-N, 5: Video Standard - PAL-M, 6: Video Standard - SECAM | 
3: Set, 4: Get | 8 | 0~1 | Video Setting | Film Mode | 0: Off, 1: On | 
3: Set, 4: Get | 9 | 0~1 | Audio Setting | Stereo | 0: Off, 1: On | 
3: Set, 4: Get | 10 | 0~1 | PIP Setting | PIP On/Off | 0: Off, 1: On | 
3: Set, 4: Get | 11 | 0~9 | PIP Setting | PIP Source | 0: VGA-1, 1: VGA-2(VP-724 Only), 3: Component, 5: AV-1, 7: AV-2, 2: DVI, 4: YC-1, 6: YV-2, 9: TV, 8: SCART | VGA-2 is VP-724 Only
3: Set, 4: Get | 12 | 0~5 | PIP Setting | PIP Size | 1: 1/16, 3: 1/4, 0: 1/25, 2: 1/9, 5: User Define, 4: Split | 
3: Set, 4: Get | 13 | 0~5 | PIP Setting | PIP Frame | 0: Off, 1: On | 
3: Set, 4: Get | 14 | 0~2 | Seamless Switch | Mode | 0: Fast, 1: Moderate, 2: Safe | 
3: Set, 4: Get | 15 | 0~2 | Seamless Switch | Background | 0: Black, 1: Blue, 2: Disable Analog Syncs | 
3: Set, 4: Get | 16 | 0~2 | Seamless Switch | Auto Search | 0: Off, 1: On | 
3: Set, 4: Get | 17 | 0~1 | OSD Setting | Startup Logo | 0: Off, 1: On | 
3: Set, 4: Get | 18 | 0~1 | OSD Setting | Size | 0: Normal, 1: Double | 
3: Set, 4: Get | 19 | 0~1 | OSD Setting | Source Prompt | 0: Off, 1: On | 
3: Set, 4: Get | 20 | 0~1 | OSD Setting | Blank Color | 0: Blue, 1: Black | 
3: Set, 4: Get | 21 | 0~17 |  | Output Resolution | 0: 640x480, 1: 800x600, 2: 1024x768, 3: 1280x1024, 4: 1600x1200, 5: 852x1024i, 6: 1024x1024i, 7: 1366x768, 8: 1365x1024, 9: 1280x720, 10: 720x483, 11: 852x480, 12: 1400x1050, 13: 480P, 14: 720P, 15: 1080i, 16: 576P, 17: 1080P, 18: 1280x768, 19: UserDefine | HDTV output is VP723/724 Only 1080P only on KI238 and 80P DAC Board
3: Set, 4: Get | 22 | 0~3 |  | Output Refresh Rate | 0: 60Hz, 1: 75Hz, 2: 85Hz, 3: 50Hz | 
3: Set, 4: Get | 23 | 0~1 |  | Factory Reset | 0: Cancel, 1: ok | 
3: Set, 4: Get | 24 | 0~3 | Advanced | Input Button | 0: Freeze/Blank, 1: Freeze, 2: Blank, 3: Ignore | 
3: Set, 4: Get | 25 | 0~1 |  | Key Lock Save |  | 
3: Set, 4: Get | 26 | 0~1 |  | Input Lock |  | 
3: Set, 4: Get | 27 | 0~1 |  | SOG Setting | 0: Auto, 1: RGsB, 2: DTV | KI239 Only
3: Set, 4: Get | 28 | 0~1 |  | Enable OSD Timeout | 0: Disable, 1: Enable | 
3: Set, 4: Get | 29 | 0~2 |  | Select Output Mode Userdefined Parameter Group | 0: Group 1, 1: Group 2, 2: Group 3 | 
3: Set, 4: Get | 30 | 0~2 |  | Set the control way of Saving Audio Volume / Treble / Bass values | 1: Individual, 0: Master, 2: Linked | 
5 | 0 | N/A |  | Load Gamma/Color - Normal |  | 
5 | 1 | N/A |  | Load Gamma/Color - Presentation |  | 
5 | 2 | N/A |  | Load Gamma/Color - Cinema |  | 
5 | 3 | N/A |  | Load Gamma/Color - Nature |  | 
5 | 4 | N/A |  | Load Gamma/Color - User1 |  | 
5 | 5 | N/A |  | Load Gamma/Color - User2 |  | 
6: Set, 7: Get | 0 | 0~1 |  | Power | 0: Power Down, 1: Power On | 
6: Set, 7: Get | 1 | 0~1 |  | Freeze | 0: Off, 1: On | 
6: Set, 7: Get | 2 | 0~1 |  | Blank | 0: Off, 1: On | 
6: Set, 7: Get | 3 | 0~1 |  | Mute | 0: Off, 1: On | 
6: Set, 7: Get | 4 | 0~1 |  | Key Lock | 0: Off, 1: On | 
8 | 0 | N/A |  | "Resolution/Refresh Rate" Or "Video Stand". Example: "Y 8 0 CR" return: "Z 8 0 1080i CR" |  | 
