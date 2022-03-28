#define STRING_LENGTH (12)

int subtitles_getSubs(char* resultString, char* inputString, int* x, int* y)
{
    if (strstr(inputString, "TITL") > 0)
    {
        char logo[STRING_LENGTH] = { '#', 'P', '0', '7', '\x82', '\x6B', '\x82', '\x6E', '\x82', '\x66', '\x82', '\x6E' }; // LOGO in Shift-JIS, color is monologue color
        int i = 0;
        while (i < STRING_LENGTH)
        {
            *resultString = logo[i];
            resultString++;
            i++;
        }
        *x = 100;
        *y = 88;
        return 350;
    }
    return 0;
}