#include <nds.h>

#ifndef _NNS_SND_H
#define _NNS_SND_H

typedef struct NNSSndSeqParam
{
    u16 bankNo;
    u8 volume;
    u8 channelPrio;
    u8 playerPrio;
    u8 playerNo;
    u16 reserved;
} NNSSndSeqParam;

typedef struct NNSSndArcSeqInfo
{
    u32 fileId;
    struct NNSSndSeqParam param;
} NNSSndArcSeqInfo;

#ifdef __cplusplus
extern "C"
{
#endif

	const NNSSndArcSeqInfo* NNS_SndArcGetSeqInfo( int seqNo );
	int NNSi_SndArcLoadSeq( int seqNo, u32 loadFlag, int heap, BOOL bSetAddr, int pData );
	void NNS_SndArcPlayerStartSeqArc(int handle, int seqArcNo, int index);
	void NNS_SndMain();
	void NNSi_SndPlayerStopSeq( int seqPlayer, int fadeFrame );

	BOOL StartSeq(int handle, int playerNo, int bankNo, int playerPrio, const NNSSndArcSeqInfo* info, int seqNo);
			
#ifdef __cplusplus
}
#endif

#endif