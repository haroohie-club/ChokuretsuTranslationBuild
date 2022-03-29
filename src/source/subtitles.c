#define STRING_LENGTH (13)

// resultString: pointer to a char array where the subtitle will be written (so it can later be read by scene_renderDialogue)
int subtitles_getSubs(char* resultString, char* inputString, char* voiceMapAddress, short* xysize)
{
    int numVoiceFiles = *((int*)voiceMapAddress) - 2;
    int* voiceMap = *((int*)voiceMapAddress + 3);

    int i = 0;
    while (i < numVoiceFiles)
    {
        char* voiceFileName = *(voiceMap + (i * 4));

        if (strstr(inputString, voiceFileName))
        {
            char* subtitle = *(voiceMap + (i * 4) + 1);
            while (*subtitle != 0)
            {
                *resultString = *subtitle;
                *resultString++;
                *subtitle++;
            }
            *resultString = 0; // zero terminator
            *xysize = *((short*)voiceMap + (i * 8) + 4);
            xysize++;
            *xysize = *((short*)voiceMap + (i * 8) + 5);
            xysize++;
            *xysize = *((short*)voiceMap + (i * 8) + 6);
            xysize -= 2;
            return *((short*)voiceMap + (i * 8) + 7);
        }

        i++;
    }

    return 0; // sets the subtitle timer to zero
}