int oamAllocation(short* oam)
{
    int xLoc = 0, yLoc = 0, tileNumber = 0;
    
    for (int i = 0; i < 48; i += 4)
    {
        short first = 0x2000 | yLoc;
        short second = 0xC000 | xLoc;
        short third = 0x2800 | tileNumber;

        *(oam + i) = first;
        *(oam + i + 1) = second;
        *(oam + i + 2) = third;

        xLoc += 0x40;
        tileNumber += 0x20;
        if (xLoc == 0x100)
        {
            xLoc = 0;
            yLoc += 0x40;
        }
    }
    return 0;
}