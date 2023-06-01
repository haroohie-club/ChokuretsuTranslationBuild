// resultString: pointer to a char array where the subtitle will be written (so it can later be read by scene_renderDialogue)
// inputString: pointer to a char array that contains the name of the voice file about to be played
// voiceMapAddress: pointer to the voice map file in memory
// xysizescreen: the x, y, font size, and target screen (0 = bottom, 1 = top) will be written to this location
// returns subtitle timer
int subtitles_getSubs(char* resultString, char* inputString, char* voiceMapAddress, short* xysizescreen)
{
    int numVoiceFiles = *((int*)voiceMapAddress) - 2;
    int* voiceMap = *((int*)voiceMapAddress + 3);

    int i = 0;
    while (i < numVoiceFiles)
    {
        char* voiceFileName = *(voiceMap + (i * 5));

        if (strstr(inputString, voiceFileName))
        {
            char* subtitle = *(voiceMap + (i * 5) + 1);
            while (*subtitle != 0)
            {
                *resultString = *subtitle;
                *resultString++;
                *subtitle++;
            }
            *resultString = 0; // zero terminator
            *xysizescreen = *((short*)voiceMap + (i * 10) + 4);
            xysizescreen++;
            *xysizescreen = *((short*)voiceMap + (i * 10) + 5);
            xysizescreen++;
            *xysizescreen = *((short*)voiceMap + (i * 10) + 6);
            xysizescreen++;
            *xysizescreen = *((short*)voiceMap + (i * 10) + 7);
            xysizescreen -= 3;
            return *((int*)voiceMap + (i * 5) + 4);
        }

        i++;
    }

    return 0; // sets the subtitle timer to zero
}