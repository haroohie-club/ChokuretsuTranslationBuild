#define STRING_LENGTH (13)

// resultString: pointer to a char array where the subtitle will be written (so it can later be read by scene_renderDialogue)
int subtitles_getSubs(char* resultString, char* inputString, short* xysize)
{
    if (strstr(inputString, "TITL") > 0)
    {
        char logo[STRING_LENGTH] = { '#', 'P', '0', '7', '\x82', '\x6B', '\x82', '\x6E', '\x82', '\x66', '\x82', '\x6E', '\x00' }; // LOGO in Shift-JIS with black color (for drop shadow)
        int i = 0;
        while (i < STRING_LENGTH)
        {
            *resultString = logo[i];
            resultString++;
            i++;
        }
        
        *xysize = (short)94; // x
        xysize += 1;
        *xysize = (short)74; // y
        xysize += 1;
        *xysize = (short)100; // size
        return 350;
    }

    return 0; // sets the subtitle timer to zero 
}