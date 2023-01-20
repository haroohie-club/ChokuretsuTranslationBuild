#include <nds.h>
#include <nds/arm9/sprite.h>

int logoSetPalette()
{
    for (int i = 0; i < 8; i++)
    {
        oamSetPalette(&oamMain, i, 14);     
    }

    return 0;
}