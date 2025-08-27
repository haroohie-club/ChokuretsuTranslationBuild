void wrapChoku()
{
    // Save friendship levels to unused flags section
    *((char *)0x020B53D4) = *((char *)0x020B53CE); // HFL
    *((char *)0x020B53D5) = *((char *)0x020B53CF); // MFL
    *((char *)0x020B53D6) = *((char *)0x020B53D0); // NFL
    *((char *)0x020B53D7) = *((char *)0x020B53D1); // KFL
    *((char *)0x020B53D8) = *((char *)0x020B53D3); // TFL
}