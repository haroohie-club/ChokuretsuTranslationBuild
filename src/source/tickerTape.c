#define MAX_LENGTH (0x100)

int tickerTape_CalculateLoadLength(unsigned int length)
{
    if (length > MAX_LENGTH)
    {
        return MAX_LENGTH;
    }
    else
    {
        return length;
    }
}