"i62c" by kook



file of code is called "code".
code is an indexed text variable.
When play begins:
	now the code is "[text of file of code]";
	repeat with I running from 1 to number of lines in code:
		process line "[line number I in code]";



table of wanted constants
name
indexed text
with 30 blank rows

to process line (l - indexed text), split at semicolons:
	if not split at semicolons:
		let instring be truth state;
		let expression be indexed text;
		repeat with i running from 1 to number of characters in l:
			let c be character number i in l;
			if c is "[quotation mark]":
				if instring is true:
					let instring be false;
				else:
					let instring be true;
			if instring is false:
				if c is ";":
					process line expression, split at semicolons;
					let expressions be "";
			let expression be "[expression][c]";
	if character number 1 in l is "!":
		say "//[l]";
	if word number 1 in l is "Constant":
		say "//[l][line break]";
		let name be the punctuated word number 2 in l;
		if number of characters in l is 2:
			say "const int [name] = 1;";
		else:
			[cut up to the value]
			replace punctuated word number 1 in l with "";
			replace punctuated word number 1 in l with "";
			if the punctuated word number 1 in l exactly matches the text "=":
				replace punctuated word number 1 in l with "";
			let type be "cow";
			if character number 1 in l is "[quotation mark]":
				let type be "char *";
			else:
				let type be "int";
				replace the text "$" in l with "0x";
			say "const [type] [name] = [l];";
	say "[line break]";
	if l matches the text "~":
		end the game in victory.


[		select an empty row in the table of constants



Constant Grammar__Version 2;

! This file was compiled by Inform 7: the build number and version of the
! I6 template layer used are as follows.
Constant NI_BUILD_COUNT "6G60";

Constant LibSerial = "080126";
Constant LibRelease = "6/12N";
Constant LIBRARY_VERSION = 612;

Constant PLUGIN_FILES;


Array UUID_ARRAY string "UUID://1755FDC7-61F1-4989-B48C-8030349522B6//";

Constant Story "@@@@";
Constant Headline "An Interactive Fiction";
Constant Story_Author SC_2;
Serial "120214";

Default Story 0;
Default Headline 0;

[ ShowExtensionVersions;
    print "Standard Rules version 2/090402 by Graham Nelson^";
];
[ ShowFullExtensionVersions;
    print "Standard Rules version 2/090402 by Graham Nelson^";
];


! Use option:
 Constant DynamicMemoryAllocation = 32000;
! Use option:
 Constant IT_MemoryBufferSize = 30000+3;
! Use option:
 Constant MATCH_LIST_WORDS = 100;


#Ifndef WORDSIZE; ! compiling with Z-code only compiler
Constant TARGET_ZCODE;
Constant WORDSIZE 2;
#Endif;

#Iftrue (WORDSIZE == 2);
Constant NULL = $ffff;
Constant WORD_HIGHBIT = $8000;
Constant WORD_NEXTTOHIGHBIT = $4000;
Constant IMPROBABLE_VALUE = $7fe3;
Constant MAX_POSITIVE_NUMBER 32767;
Constant MIN_NEGATIVE_NUMBER -32768;
Constant REPARSE_CODE = 10000;
#Endif;

Constant ROM_COMPVERSION      = $30;     ! four ASCII characters
Constant ROM_GAMERELEASE      = $34;     ! short word
Constant ROM_GAMESERIAL       = $36;     ! six ASCII characters

#Endif;

Array PowersOfTwo_TB
  --> $$100000000000
      $$010000000000
      $$001000000000
      $$000100000000
      $$000010000000
      $$000001000000
      $$000000100000
      $$000000010000
      $$000000001000
      $$000000000100
      $$000000000010
      $$000000000001;

Array IncreasingPowersOfTwo_TB
  --> $$0000000000000001
      $$0000000000000010
      $$0000000000000100
      $$0000000000001000
      $$0000000000010000
      $$0000000000100000
      $$0000000001000000
      $$0000000010000000
      $$0000000100000000
      $$0000001000000000
      $$0000010000000000
	  $$0000100000000000
	  $$0001000000000000
	  $$0010000000000000
	  $$0100000000000000
	  $$1000000000000000;

Constant NORMAL_VMSTY     = 0;
Constant HEADER_VMSTY     = 3;
Constant SUBHEADER_VMSTY  = 4;
Constant ALERT_VMSTY      = 5;
Constant NOTE_VMSTY       = 6;
Constant BLOCKQUOTE_VMSTY = 7;
Constant INPUT_VMSTY      = 8;

Constant CLR_DEFAULT = 1;
Constant CLR_BLACK   = 2;
Constant CLR_RED     = 3;
Constant CLR_GREEN   = 4;
Constant CLR_YELLOW  = 5;
Constant CLR_BLUE    = 6;
Constant CLR_MAGENTA = 7; Constant CLR_PURPLE  = 7;
Constant CLR_CYAN    = 8; Constant CLR_AZURE   = 8;
Constant CLR_WHITE   = 9;

Constant WIN_ALL     = 0; ! Both windows at once

[ ENABLE_GLULX_ACCEL_R addr res;
	@gestalt 9 0 res;
	if (res == 0) return;
	addr = #classes_table;
	@accelparam 0 addr;
	@accelparam 1 INDIV_PROP_START;
	@accelparam 2 Class;
	@accelparam 3 Object;
	@accelparam 4 Routine;
	@accelparam 5 String;
	addr = #globals_array + WORDSIZE * #g$self;
	@accelparam 6 addr;
	@accelparam 7 NUM_ATTR_BYTES;
	addr = #cpv__start;
	@accelparam 8 addr;
	@accelfunc 1 Z__Region;
	@accelfunc 2 CP__Tab;
	@accelfunc 3 RA__Pr;
	@accelfunc 4 RL__Pr;
	@accelfunc 5 OC__Cl;
	@accelfunc 6 RV__Pr;
	@accelfunc 7 OP__Pr;
	rfalse;
];

[ VM_Describe_Release i;
	print "Release ";
	@aloads ROM_GAMERELEASE 0 i;
	print i;
	print " / Serial number ";
	for (i=0 : i<6 : i++) print (char) ROM_GAMESERIAL->i;
];

[ VM_KeyChar win nostat done res ix jx ch;
    jx = ch; ! squash compiler warnings
    if (win == 0) win = gg_mainwin;
    if (gg_commandstr ~= 0 && gg_command_reading ~= false) {
        done = glk_get_line_stream(gg_commandstr, gg_arguments, 31);
        if (done == 0) {
            glk_stream_close(gg_commandstr, 0);
            gg_commandstr = 0;
            gg_command_reading = false;
            ! fall through to normal user input.
        } else {
            ! Trim the trailing newline
            if (gg_arguments->(done-1) == 10) done = done-1;
            res = gg_arguments->0;
            if (res == '\') {
                res = 0;
                for (ix=1 : ix<done : ix++) {
                    ch = gg_arguments->ix;
                    if (ch >= '0' && ch <= '9') {
                        @shiftl res 4 res;
                        res = res + (ch-'0');
                    } else if (ch >= 'a' && ch <= 'f') {
                        @shiftl res 4 res;
                        res = res + (ch+10-'a');
                    } else if (ch >= 'A' && ch <= 'F') {
                        @shiftl res 4 res;
                        res = res + (ch+10-'A');
                    }
                }
            }
       		jump KCPContinue;
        }
    }
    done = false;
    glk_request_char_event(win);
    while (~~done) {
        glk_select(gg_event);
        switch (gg_event-->0) {
          5: ! evtype_Arrange
            if (nostat) {
                glk_cancel_char_event(win);
                res = $80000000;
                done = true;
                break;
            }
            DrawStatusLine();
          2: ! evtype_CharInput
            if (gg_event-->1 == win) {
                res = gg_event-->2;
                done = true;
                }
        }
        ix = HandleGlkEvent(gg_event, 1, gg_arguments);
        if (ix == 2) {
            res = gg_arguments-->0;
            done = true;
        } else if (ix == -1)  done = false;
    }
    if (gg_commandstr ~= 0 && gg_command_reading == false) {
        if (res < 32 || res >= 256 || (res == '\' or ' ')) {
            glk_put_char_stream(gg_commandstr, '\');
            done = 0;
            jx = res;
            for (ix=0 : ix<8 : ix++) {
                @ushiftr jx 28 ch;
                @shiftl jx 4 jx;
                ch = ch & $0F;
                if (ch ~= 0 || ix == 7) done = 1;
                if (done) {
                    if (ch >= 0 && ch <= 9) ch = ch + '0';
                    else                    ch = (ch - 10) + 'A';
                    glk_put_char_stream(gg_commandstr, ch);
                }
            }
        } else {
            glk_put_char_stream(gg_commandstr, res);
        }
        glk_put_char_stream(gg_commandstr, 10); ! newline
    }
  .KCPContinue;
    return res;
];

[ VM_KeyDelay tenths  key done ix;
    glk_request_char_event(gg_mainwin);
    glk_request_timer_events(tenths*100);
    while (~~done) {
        glk_select(gg_event);
        ix = HandleGlkEvent(gg_event, 1, gg_arguments);
        if (ix == 2) {
            key = gg_arguments-->0;
            done = true;
        }
        else if (ix >= 0 && gg_event-->0 == 1 or 2) {
            key = gg_event-->2;
            done = true;
        }
    }
    glk_cancel_char_event(gg_mainwin);
    glk_request_timer_events(0);
    return key;
];



#IFNOT; ! IFDEF MEMORY_HEAP_SIZE

[ RELATION_TY_Support t a b c; rfalse; ];
[ RELATION_TY_Say comb; ];
[ RELATION_TY_Name rel txt; ];

#ENDIF; ! IFDEF MEMORY_HEAP_SIZE


[ RELATION_TY_Empty rel set  handler;
	handler = rel-->RR_HANDLER;
	return handler(rel, RELS_EMPTY, set);
];


Array ResourceIDsOfFigures --> 0 1  0;

Array ResourceIDsOfSounds --> 0  0;


[ CreateBlockConstants;
];



! End of automatically generated I6 source
! --------------------------------------------------------------------------


]


to decide what indexed text is indexed text (t - text):
	let i be an indexed text;
	let i be t;
	decide on t;












[
	say "// | csplit -f codes /////codes:/";
]

#### is a room.


Rule for printing the banner text: say "/*[banner text]*/" instead.


Use MAX_STATIC_DATA of 800000.
Use dynamic memory allocation of at least 32000.
Use maximum indexed text length of at least 30000.

